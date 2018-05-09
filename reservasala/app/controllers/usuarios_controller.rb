class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.all
  end

  def new
    @usuarios = Usuario.new
  end
end