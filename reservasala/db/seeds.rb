mais_usuarios = [
    {:nome => 'André', :email => 'andre@email.com', :senha => 'senha1'},
    {:nome => 'Pedro', :email => 'pedro@email.com', :senha => 'senha2'},
    {:nome => 'Bruno', :email => 'bruno@email.com', :senha => 'senha3'}
]

mais_usuarios.each do |usuario|
  Usuario.create!(usuario)
end

mais_salas = [
    {:predio => 'PAT - Pavilhão Anísio Teixeira', :numero => 'AT-029'},
    {:predio => 'PJC - Pavilhão João Calmon',:numero => 'BT-085'},
    {:predio => 'PJC - Pavilhão João Calmon',:numero => 'BT-124'}
]

mais_salas.each do |sala|
  Sala.create!(sala)
end

mais_horarios = [
    {:horario => Time.parse('8:00')},
    {:horario => Time.parse('10:00')},
    {:horario => Time.parse('12:00')},
    {:horario => Time.parse('14:00')},
    {:horario => Time.parse('16:00')},
    {:horario => Time.parse('18:00')},
    {:horario => Time.parse('20:00')},
    {:horario => Time.parse('22:00')}
]

mais_horarios.each do |horario|
  Horario.create!(horario)
end

mais_reservas = [
    {:data => Date.parse('14/06/2018', '%m/%d/%Y'), :materia => 'Banco de Dados', :turma => 'D', :usuario => Usuario.find(1), :sala => Sala.find(1), :horario => Horario.find(1)},
    {:data => Date.parse('14/06/2018', '%m/%d/%Y'), :materia => 'Engenharia de Software', :turma => 'C', :usuario => Usuario.find(2), :sala => Sala.find(2), :horario => Horario.find(4)},
    {:data => Date.parse('14/06/2018', '%m/%d/%Y'), :materia => 'Computação em Nuvem', :turma => 'A', :usuario => Usuario.find(3), :sala => Sala.find(3), :horario => Horario.find(5)}
]

mais_reservas.each do |reserva|
  Reserva.create!(reserva)
end