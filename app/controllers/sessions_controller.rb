class SessionsController < ApplicationController
  def new
    # acts as a login page
    @user = User.new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    self.current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end
end
