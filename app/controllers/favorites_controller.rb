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
    locations = favorites.map{ |vendor| {title: vendor.username, coords: {lat: vendor.latitude, lng: vendor.longitude}} }
    render :json => locations
  end

  private

  def favorites_params
    params.require(:favorite).permit(:vendor_id, :customer_id)
  end
end
