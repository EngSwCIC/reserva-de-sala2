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

  describe 'creating a new reservation' do
    it 'should create a new reservation' do
      request.session[:current_user_id] = 2
      post :create, :params => {:reserva => {:materia => 'teste', :turma => 'A', :sala => Sala.find_by_id(1), :data => Date.new, :horario => Horario.find_by_id(1)}}, :format => :js
      reser = Reserva.find_by_materia('teste')
      expect(assigns(:reserva)).to eq(reser)
    end
    it 'should redirect to salas index when created' do
      request.session[:current_user_id] = 2
      post :create, :params => {:reserva => {:materia => 'teste', :turma => 'A', :sala => Sala.find_by_id(1), :data => Date.new, :horario => Horario.find_by_id(1)}}, :format => :js

      # status 302 on http response so is redirected to /salas
      expect(response).to have_http_status(302)
    end
    it 'should require the field materia' do
      request.session[:current_user_id] = 2
      post :create, :params => {:reserva => {:turma => 'A', :sala => Sala.find_by_id(1), :data => Date.new, :horario => Horario.find_by_id(1)}}, :format => :js
      reser = Reserva.find_by_turma('A')
      expect(assigns(:reserva)).to_not eq(reser)
    end
    it 'should require the field turma' do
      request.session[:current_user_id] = 2
      post :create, :params => {:reserva => {:materia => 'teste', :sala => Sala.find_by_id(1), :data => Date.new, :horario => Horario.find_by_id(1)}}, :format => :js
      reser = Reserva.find_by_materia('teste')
      expect(assigns(:reserva)).to_not eq(reser)
    end
    it 'should require the field sala' do
      request.session[:current_user_id] = 2
      post :create, :params => {:reserva => {:materia => 'teste', :turma => 'A', :data => Date.new, :horario => Horario.find_by_id(1)}}, :format => :js
      reser = Reserva.find_by_materia('teste')
      expect(assigns(:reserva)).to_not eq(reser)
    end
  end
end