class Sala < ActiveRecord::Base
  has_many :reservas
end