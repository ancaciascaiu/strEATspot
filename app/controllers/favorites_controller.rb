class FavoritesController < ApplicationController

  def create
	@favorite = Favorite.new(favorites_params)
	if @favorite.save
		redirect_to '/welcome/index'
	else
		redirect_to '/welcome/index' #to be refactored
	end
  end

  def show
    favorites = []
    current_customer.vendors.each do |vendor|
      if vendor.latitude && vendor.longitude
        favorites << vendor
      end
    end
    p favorites
    locations = favorites.map{ |vendor| {title: vendor.username, coords: {lat: vendor.latitude, lng: vendor.longitude}} }
    p locations
    render :json => locations
  end

  private

  def favorites_params
    params.require(:favorite).permit(:vendor_id, :customer_id)
  end
end
# {title: "Tory's Tortillas", lat: 41.878600, lng: -87.644003}
