class Horario < ActiveRecord::Base
  has_many :reservas
end