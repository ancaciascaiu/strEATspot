class FoodcategoriesController < ApplicationController
  def show
  	@category = Foodcategory.find(params[:format])
  end

end
