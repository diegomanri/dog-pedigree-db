module AccessHelper

  # Adding this login functionality for Update in password_resets_controller.rb to work
  def log_in(user)
    session[:user_id] = user.id
  end
end
