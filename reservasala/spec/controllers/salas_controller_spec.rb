require 'spec_helper'

describe SalasController do

  describe 'initializing salas page' do
    it 'should render the right template to salas index' do
      get :index
      expect(response).to render_template('index')
    end
    it 'should initialize all salas' do
      salas = Sala.all
      get :index
      expect(assigns(:salas)).to eq(salas)
    end
  end
end