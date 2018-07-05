class ReservasController < ActionController::Base
  def new
  end

  def create
    permitted = params.require(:reserva).permit(:materia, :turma, :sala, :data, :horario)
    permitted[:sala] = Sala.find_by_id(permitted[:sala])
    permitted[:horario] = Horario.find_by_id(permitted[:horario])
    permitted[:usuario] = Usuario.find_by_id(session[:current_user_id])
    @reserva = Reserva.new(permitted)

    respond_to do |format|
      @errorMateria = []
      @errorTurma = []
      @errorSala = []
      @errorData = []
      @errorHorario = []

      if @reserva.save
        format.html
        format.js
        redirect_to salas_path
      else
        format.html { render :new }
        format.js
        if (@reserva.errors["materia"] != nil)
          @errorMateria.push(@reserva.errors["materia"][0])
        end
        if (@reserva.errors["turma"] != nil)
          @errorTurma.push(@reserva.errors["turma"][0])
        end
        if (@reserva.errors["sala"] != nil)
          @errorSala.push(@reserva.errors["sala"][0])
        end
        if (@reserva.errors["data"] != nil)
          @errorData.push(@reserva.errors["data"][0])
        end
        if (@reserva.errors["horario"] != nil)
          @errorHorario.push(@reserva.errors["horario"][0])
        end
      end
    end
  end
end