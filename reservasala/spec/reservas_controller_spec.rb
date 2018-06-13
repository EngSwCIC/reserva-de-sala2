require 'rails_helper'

describe ReservasController do
  describe 'nova reserva' do
    it 'chama o metodo que faz a inclusão de uma nova reserva' do
      post :create, {materia: 'ES', turma: 'B', sala: 'AT04', data: '2018-06-14', horario: '8:00'}
    end

  end
end