class PedigreesController < ApplicationController

  def new
    @pedigree = Pedigree.new
    @user_dogs = current_user.dogs
  end

  def create
    @pedigree = Pedigree.new(pedigree_params)
    if @pedigree.save
      flash[:success] = "Dog relative added."
      redirect_to access_dogmenu_path
    else
      flash[:danger] = "Unable to add this dog as relative"
      redirect_to access_dogmenu_path
    end
  end

  def destroy
    pedigree = Pedigree.find(params[:id])
    if pedigree.nil?
      flash[:danger] = "Dog relation not found"
    elsif pedigree.destroy
      flash[:success] = "Relative Removed"
      respond_to do |format|
        format.html { redirect_to access_dogmenu_path }
      end
    else
      flash[:danger] = "We could not get the relation"
      redirect_to access_dogmenu_path
    end
  end

  private

  def pedigree_params
    params.permit(:dog_id, :relative_id, :relation_name)
  end

end