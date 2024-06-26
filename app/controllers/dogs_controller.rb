class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, except: [:show, :dog_search]
  before_filter :admin_only, only: :index
  before_filter :dog_owner?, only: [:edit, :update, :destroy]
  layout 'authenticated'

  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all.paginate(page: params[:page], per_page: 15)
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    #@dogs = current_user.dogs
    @pedigree = Pedigree.new
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  def dog_search
    @dogs = Dog.all
    if params[:search]
      @dogs = Dog.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 15)
    else
      @dogs = Dog.all.order('created_at DESC').paginate(page: params[:page], per_page: 15)
    end
  end

  # This will be used for users to only be able to edit, update and delete their own dogs.
  # Admins can do anything with dogs.
  def dog_owner?
    unless current_user.admin?
      if current_user != @dog.user
        flash[:danger] = "You can't modify other user's dogs!"
        redirect_to access_dogmenu_path
      end
    end
  end

  # POST /dogs
  # POST /dogs.json
  def create
    # @dog = Dog.new(dog_params)
    #
    # respond_to do |format|
    #   if @dog.save
    #     format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
    #     format.json { render :show, status: :created, location: @dog }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @dog.errors, status: :unprocessable_entity }
    #   end
    # end

    #Trying code from page 505
    @dog = current_user.dogs.build(dog_params)
    if @dog.save
      flash[:success] = "Dog created!"
      redirect_to access_dogmenu_path
    else
      render :new
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog }
        flash[:success] = "Dog was properly updated"
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url }
      flash[:success] = "Dog was successfully removed from the application"
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:dname, :breed, :variety, :dob, :height, :weight, :pedinum, :occupation, :workcert,
                                  :health, :dcomments, :avatar, :user_id, :avatar_url, :sex)
    end
end
