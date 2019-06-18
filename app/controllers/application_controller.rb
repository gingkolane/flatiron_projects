class ApplicationController < ActionController::Base
  before_action :find_user

  def find_user 
    @user_id = session[:user_id]
    @logged_in = !!@user_id
    if @logged_in 
      @current_user = User.find(@user_id)
    end 
  end 

  def logout
    session[:user_id] = nil
  end
end
