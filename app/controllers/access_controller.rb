class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_filter :admin_only, :only => :admin

  def authenticated
    #Displays a regular  user menu
  end

  def login
    #Displays the login form
  end

  def admin
    #Displays the admin menu
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
      # These two if statements wll check if the user has a session and if the user is an admin.
      # If the user is an admin then it will be redirected to access/admin otherwise to access/authenticated.
      if session[:user_id]
        if authorized_user.try(:admin?)
            redirect_to(:action => 'admin')
        else
        redirect_to(:action => 'authenticated')
        end
      end
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
