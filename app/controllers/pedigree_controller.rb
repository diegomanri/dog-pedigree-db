class PedigreeController < ApplicationController

end
  def new
    @pedigree = Pedigree.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    #@pedigree = pedigrees.build(dog_id: @dog.id, relative_id: @dog.id, relation_name: :string)
    @pedigree = Pedigree.build(pedigree_params)
    @pedigree.relative_id = @dog
    if @pedigree.save
      flash[:success] = "Dog relative added."
      redirect_to access_dogmenu_path
    else
      flash[:danger] = "Unable to add this dog as relative"
      redirect_to access_dogmenu_path
    end

  def destroy
    @pedigree = @dog.pedigrees.find(params[:id])
    @pedigree.destroy
    flash[:success] = "Relative removed."
    redirect_to access_dogmenu_path
  end

  private

  def pedigree_params
    params.require(:pedigree).permit(:dog_id, :relative_id, :relation_name)
  end
end