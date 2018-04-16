class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: 'Cerraste la sesion po wn'
  end
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present?
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Ingresaste po wn'
      else
        redirect_to root_path, alert: 'Tus credenciales no son validas po wn'
      end
    else
      redirect_to root_path, alert: 'No ingresaste asdsada po wn'
    end
  end
end
