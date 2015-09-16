class SessionsController < ApplicationController
  def new
    # acts as a login page
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      redirect_to cats_url
    else
      flash[:errors] = ["Username/password combination not found."]
      @user = User.new
      render :new
    end
  end

  def destroy
    self.current_user.reset_session_token!
    session[:session_token] = nil
  end
end
