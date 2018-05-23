class Sala < ActiveRecord::Base
  before_save { self.numero = numero }
  validates :numero, presence: {message: "Informe a sala:"}
  validates_format_of :numero, :with => /\A([a-b]t)-([0-1][0-9]{2})\Z/i, :on => :create, message: "Informe uma sala válida"

end