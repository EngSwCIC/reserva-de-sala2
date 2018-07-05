class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.all
  end

  def new

  end

  def create
    @usuario = Usuario.new(usuario_params)
    @login = Usuario.find_by_nome(usuario_params[:nome])
    respond_to do |format|
      @errorNomeLogin = []
      @errorSenhaLogin = []
      @errorNome = []
      @errorEmail = []
      @errorSenha = []
      if @login.present? && @login.senha == usuario_params[:senha]
        session[:current_user_id] = @login.id
        redirect_to salas_path
      else
        format.html{render 'index'}
        format.js
        @errorNomeLogin.push("Login ou senha inválidos")
        @errorSenhaLogin.push("Login ou senha inválidos")
      end

      if @usuario.save
        flash[:success] = "Usuario cadastrado com sucesso!"
        redirect_to usuarios_path
      else
        format.html
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