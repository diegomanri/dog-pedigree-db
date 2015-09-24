class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    #Displays admin user menu
  end

  def authenticated
    #Displays a regular authenticated user menu
  end

  def login
    #Displays the login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        #This nested if will check if the email_confirmed attribute is set to TRUE in order to proceed with
        # authentication.
        if found_user.email_confirmed
            authorized_user = found_user.authenticate(params[:password])
        else
          flash.now[:error] = "Please activate your account by clicking the activation link sent to your email"
        end
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'authenticated')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
end
