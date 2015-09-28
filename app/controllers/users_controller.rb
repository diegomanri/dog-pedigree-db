class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, except: [:create, :confirm_email]
  before_filter :admin_only, except: [:show, :edit, :update, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # Show will just display other user's profiles to admins, regular users can only see their own prof.
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_url, flash: {notice: "Access denied."}
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_url, flash: {notice: "Access denied."}
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    #Added mailer action here to deliver mail when successful or display error went user creation didn't work.
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to root_url, notice: 'Please confirm your email address to continue' }
      else
          format.html { render 'public/registration' }
      end
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Dogspace! Your email has been confirmed. Please Log In to continue"
      redirect_to access_login_path
    else
      flash[:error] = "Sorry. The user does not exist"
      redirect_to root_url
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        unless current_user.admin?
          unless @user == current_user
            redirect_to root_url, flash: {notice: "Access denied."}
          end
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Will deny access of admin functionality to non-admin users.
    def admin_only
      unless current_user.admin?
        redirect_to root_url, flash: {notice: "Access denied."}
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:ufname, :umname, :ulname, :uemail, :username, :password,
                                   :email_confirmation, :password_confirmation, :role)
    end
end
