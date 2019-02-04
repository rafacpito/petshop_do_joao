class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only:[:destroy, :edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, :flash => { :success => "Usúario atualizado com sucesso!"}
    else
      redirect_to edit_user_path, :flash => { :danger => "Erro ao atualizar usuário!"}
    end
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to users_path, :flash => { :success => "Usúario cadastrado com sucesso!"}
    else
      redirect_to new_user_path, :flash => { :danger => "Erro ao criar usuário!"}
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, flash: {success: 'Usuário excluido com sucesso!'}
    else
      redirect_to users_path, flash: {danger: 'Erro ao excluir usuário!'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
