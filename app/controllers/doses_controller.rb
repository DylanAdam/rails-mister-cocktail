class DosesController < ApplicationController
	before_action :set_dose, only: [:show, :edit, :update,  :destroy]
 
  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @dose.update(dose_params)

    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end 

  private

  def set_dose
  	@dose = Dose.find(params[:id])
  end


  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
