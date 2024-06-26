class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  # before_action :valid_user, only: [:edit, :update] <- removing action for non-working method
  before_action :check_expiration, only: [:edit, :update]


  def new
  end

  def index
    redirect_to root_url
  end

  def create
    @user = User.find_by(uemail: params[:password_reset][:uemail].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash[:success] = "Email sent with password reset instructions"
      redirect_to root_url
    end
  end

  def edit
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Returns true if password is blank.
  def password_blank?
    params[:user][:password].blank?
  end

  def get_user
    @user = User.find_by(uemail: params[:uemail])
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset link has expired."
      redirect_to new_password_reset_url
    end
  end
end
