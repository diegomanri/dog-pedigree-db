class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Adding this might help me with my basic authorization
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  # Will deny access of admin functionality to non-admin users.
  def admin_only
    unless current_user.admin?
      redirect_to access_authenticated_path, flash: {notice: "Access denied."}
    end
  end


  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end
end
