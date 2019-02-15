class CocktailsController < ApplicationController
	before_action :set_cocktail, only: [:show, :edit, :update]

  def index
		@cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name, :doses, :ingredients, :photo)
  end
end
