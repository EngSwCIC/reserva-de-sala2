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
        format.js
        format.json
        flash[:success] = "Reserva feita com sucesso!"
        redirect_to salas_path
      else
        format.json
        format.js
        @reserva.errors.any?
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

  def reservas_user
    id = session[:current_user_id]
    @usuario = Usuario.find_by_id(id)
    @reservas_u = Reserva.where(usuario_id: [id]).order(:data).order(:horario_id)
  end

  def reservas_sala
    id = session[:current_user_id]
    @usuario = Usuario.find_by_id(id)
    sala_id = params[:id]
    @sala = Sala.find_by_id(sala_id)
    @reservas_s = Reserva.where(sala_id: [sala_id]).order(:data).order(:horario_id)
  end

  def destroy
    @reserva = Reserva.find_by_id(params[:id])
    @reserva.destroy
    redirect_to reservas_user_path
  end

end