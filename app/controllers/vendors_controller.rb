class VendorsController < ApplicationController

	def show
    @vendor = Vendor.find(params[:id])
  end

private

  def vendor_params
    params.require(:vendor).permit(:profile_picture)
  end

end