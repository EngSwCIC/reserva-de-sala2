class Reserva < ActiveRecord::Base
  validates :materia, presence: {message: "Informe uma matéria"}
  validates :turma, presence: {message: "Informe uma turma"}
  validates :sala, presence: {message: "Informe uma sala"}
  validates :data, presence: {message: "Informe uma data"}
  validates :horario, presence: {message: "Informe um horário"}

  belongs_to :sala
  belongs_to :usuario
  belongs_to :horario
end