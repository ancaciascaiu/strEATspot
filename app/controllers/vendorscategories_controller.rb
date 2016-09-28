class VendorscategoriesController < ApplicationController
  
  def destroy
  	@vendorscategory = Vendorscategory.find_by(foodcategory_id: vendorscategory_params[:foodcategory_id], vendor_id: vendorscategory_params[:vendor_id])
  	@vendorscategory.destroy!
  	redirect_to "/vendors/edit"
  end

  def create 
	@vendorscategory = Vendorscategory.new(vendorscategory_params)
	if @vendorscategory.save
		Vendorscategory.create(vendorscategory_params)
		redirect_to "/vendors/#{vendorscategory_params[:vendor_id]}"
	else
		redirect_to '/welcome/index'
	end
  end


  private

  def vendorscategory_params
    params.require(:vendorscategory).permit(:foodcategory_id, :vendor_id)
  end
  
end

