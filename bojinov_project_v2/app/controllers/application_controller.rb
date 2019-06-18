class ApplicationController < ActionController::Base
  helper_method :current_user

  def valid_user(params)
    !User.where(name: params[:user], password: params[:password], confirmed: true).empty?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_login
    if current_user.nil?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path 
    end
  end
end
