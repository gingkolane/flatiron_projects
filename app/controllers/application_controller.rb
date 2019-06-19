class ApplicationController < ActionController::Base
  before_action :find_user

  def find_user 
    @user_id = session[:user_id]
    @logged_in = !!@user_id
    if @logged_in 
      @current_user = User.find(@user_id)
    end 
  end 

  def search_investigators 
    # create variable that stores search bar results
    @investigators = Investigator.where(NAME_DEGREE like )
  end 

  def logout
    session[:user_id] = nil
  end
end
