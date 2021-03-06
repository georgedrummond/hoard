class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_setup, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_setup
    redirect_to setup_path unless RequiredEnv.set?
  end

  private

  def require_user
    redirect_to login_path unless current_user
  end
end
