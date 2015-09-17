class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user!
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      session[:session_token] = @user.session_token
      flash[:welcome] = "Welcome, #{@user.username}!"
      redirect_to cats_url
    else
      flash[:errors] = ["Username/password combination not found."]
      @user = User.new
      render :new
    end
  end
end
