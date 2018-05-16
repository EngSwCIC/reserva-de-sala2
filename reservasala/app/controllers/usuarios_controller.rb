class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.all
  end

  def new

  end

  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |format|
      @errorNome = []
      @errorEmail = []
      @errorSenha = []
      if @usuario.save
        format.js
        format.json
        flash[:success] = "Usuario cadastrado com sucesso!"
        redirect_to usuarios_path
      else
        format.json
        format.js
        @usuario.errors.any?
        if (@usuario.errors["nome"] != nil)
          @errorNome.push(@usuario.errors["nome"][0])
        end
        if (@usuario.errors["email"] != nil)
          @errorEmail.push(@usuario.errors["email"][0])
        end
        if (@usuario.errors["senha"] != nil)
          @errorSenha.push(@usuario.errors["senha"][0])
        end
      end
    end
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :senha)
  end
end