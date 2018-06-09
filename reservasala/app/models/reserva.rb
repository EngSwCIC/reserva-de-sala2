class Reserva < ActiveRecord::Base
  belongs_to :sala
  belongs_to :usuario
  belongs_to :horario
end