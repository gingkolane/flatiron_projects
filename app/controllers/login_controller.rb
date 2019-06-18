class LoginController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:messages] = "Logging in #{@user.name}."
      redirect_to @user
    else
      flash[:messages] = "Incorrect username or password!"
      redirect_to new_login_path
    end
  end

  def destroy
    logout
    redirect_to new_login_path
  end
  

end
