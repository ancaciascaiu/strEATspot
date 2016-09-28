class FoodcategoriesController < ApplicationController
  def show
  	@category = Foodcategory.find(params[:format])
  end

  def create 
	@foodcategory = Foodcategory.new(name: foodcategory_params[:name])
	if @foodcategory.save
		Vendorscategory.create(vendor_id: foodcategory_params[:vendor_id], foodcategory_id: @foodcategory.id)
		redirect_to "/vendors/edit"
	else
		redirect_to '/welcome/index' #to be refactored
	end
  end

  private

  def foodcategory_params
    params.require(:foodcategory).permit(:name, :vendor_id)
  end

end
