require 'spec_helper'

describe UsuariosController do

  describe 'initializing login page' do
    it 'should render the right template for usuarios index' do
      get :index
      expect(response).to render_template('index')
    end
    it 'should initialize all users' do
      usuarios = Usuario.all
      get :index
      expect(assigns(:usuarios)).to eq(usuarios)
    end
  end


  describe 'trying to make login' do
    let(:pedro) { Usuario.find_by_nome('Pedro') }
    it 'should find the correct user' do
      post :create, :params => {:usuario => {:nome => 'Pedro'}}, :xhr => true
      expect(assigns(:login)).to eq(pedro)
    end
    it 'should not find this user' do
      post :create, :params => {:usuario => {:nome => 'DAsasasas'}}, :xhr => true
      expect(assigns(:login)).to eq(nil)
    end
    it 'should redirect to salas index when matches login' do
      post :create, :params => {:usuario => {:nome => 'Pedro', :senha => 'senha2'}}, :format => :js
      expect(assigns(:login)).to eq(pedro)
    end
  end
end