class FavoritesController < ApplicationController

  def create 
	@favorite = Favorite.new(favorites_params)
	if @favorite.save
		redirect_to '/welcome/index'
	else
		redirect_to '/welcome/index' #to be refactored
	end
  end

  private

  def favorites_params
    params.require(:favorite).permit(:vendor_id, :customer_id)
  end
end
