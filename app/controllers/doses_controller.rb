class DosesController < ApplicationController
	before_action :set_dose, only: [:show, :edit, :destroy]
 
  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
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
