class FoodcategoriesController < ApplicationController
  def show
  	@category = Foodcategory.find(params[:format])
  end

  def create
  	@foodcategory = Foodcategory.new(name: foodcategory_params[:name])
  	# @vendor = Vendor.find(foodcategory_params[:vendor_id])
  	if @foodcategory.save
  		Vendorscategory.create(vendor_id: foodcategory_params[:vendor_id], foodcategory_id: @foodcategory.id)
  		redirect_to "/vendors/#{foodcategory_params[:vendor_id]}"
  	else
  		redirect_to '/welcome/index' #to be refactored
  	end
  end

  def filter
    p params
    category_vendors = []
    Foodcategory.find_by(id: params[:customer][:category_id]).vendors.each do |vendor|
      if vendor.latitude && vendor.longitude
        category_vendors << vendor
      end
    end
    locations = category_vendors.map{ |vendor| {title: vendor.username, coords: {lat: vendor.latitude, lng: vendor.longitude}} }
    render :json => locations
  end

  private

  def foodcategory_params
    params.require(:foodcategory).permit(:name, :vendor_id)
  end

end
