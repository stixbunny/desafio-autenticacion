class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Esto inicia la sesion
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Ingresaste po wn"
    else
      redirect_to users_sign_up_path, notice: "No ingresaste po wn"
    end
  end

  private
  def user_params
    params.required(:user).permit(:name, :email, :password)
  end
end
