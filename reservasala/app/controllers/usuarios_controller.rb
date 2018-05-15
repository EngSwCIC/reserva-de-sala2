class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.all
  end

  def new

  end

  def create

  end
end