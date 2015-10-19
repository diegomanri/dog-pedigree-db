module AccessHelper

  # Adding this login functionality for Update in password_resets_controller.rb to work
  def log_in(user)
    session[:user_id] = user.id
  end

  # The famous current user method, added later on so that the application can work with most tuts.
  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    end
  end

end
