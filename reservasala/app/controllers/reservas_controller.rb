class ReservasController < ActionController::Base
  def index
    @reservas = Reserva.all
  end

end