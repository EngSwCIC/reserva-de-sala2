class Usuario < ActiveRecord::Base
  validates :nome, presence: {message: "Informe um nome"}

  before_save { self.email = email.downcase }
  validates :email, presence: {message: "Informe um email"}, uniqueness: {case_sensitive: false, message: "Email já cadastrado"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: "Informe um email válido"

  validates :senha, presence: {message: "Informe uma senha"}
end