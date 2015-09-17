class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
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
