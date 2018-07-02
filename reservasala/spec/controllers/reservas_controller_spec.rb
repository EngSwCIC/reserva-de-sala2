require 'spec_helper'

describe ReservasController do

  describe 'selecting option to show my reservations' do
    before(:each) do
      request.session[:current_user_id] = 2
    end
    it 'should render the right template for reservas_user' do
      get :reservas_user
      expect(response).to render_template('reservas_user')
    end
    it 'should initialize the right user' do
      usuario = Usuario.find_by_id 2
      get :reservas_user
      expect(assigns(:usuario)).to eq(usuario)
    end
    it 'should get the correct reservations for that user' do
      reservas_u = Reserva.where(usuario_id: 2)
      get :reservas_user
      expect(assigns(:reservas_u)).to match_array(reservas_u)
    end
    it 'should not get the reservation from another user' do
      reserva = Reserva.where(usuario_id: 1).first
      get :reservas_user
      expect(assigns(:reservas_u)).to_not include(reserva)
    end
  end

  describe 'selecting option to show reservations for a room' do
    before(:each) do
      request.session[:current_user_id] = 2
    end
    it 'should render the right template for reservas_sala' do
      get :reservas_sala, {:id => '1'}
      expect(response).to render_template('reservas_sala')
    end
    it 'should initialize the right room' do
      sala = Sala.find_by_id 1
      get :reservas_sala, {:id => '1'}
      expect(assigns(:sala)).to eq(sala)
    end
    it 'should get the correct reservations for that room' do
      reservas_s = Reserva.where(sala_id: 1)
      get :reservas_sala, {:id => '1'}
      expect(assigns(:reservas_s)).to match_array(reservas_s)
    end
    it 'should not get the reservation from another room' do
      reserva = Reserva.where(sala_id: 2).first
      get :reservas_sala, {:id => '1'}
      expect(assigns(:reservas_s)).to_not include(reserva)
    end
  end
end