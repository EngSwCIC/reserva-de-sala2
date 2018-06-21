class SalasController < ActionController::Base
  def index
    id = session[:current_user_id]
    @usuario = Usuario.find_by_id(id)
    @salas = Sala.all
  end

end