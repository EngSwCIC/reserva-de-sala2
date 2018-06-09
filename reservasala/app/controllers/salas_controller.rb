class SalasController < ActionController::Base
  def index
    @salas = Sala.all
  end

end