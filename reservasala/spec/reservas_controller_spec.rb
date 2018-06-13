require 'rails_helper'

describe ReservasController do
  describe 'nova reserva' do
    it 'chama o metodo que faz a inclusão de uma nova reserva' do
      fake_results = [double('movie1'), double('movie2')]
      expect(Movie).to receive(:find_in_tmdb).with('hardware').
          and_return(fake_results)
      post :create, {:reserva => {:materia => 'ES',:turma => 'A',:sala => 'AT-029',:data => '2018-11-04',:horario => '8:00'}}
    end

  end
end