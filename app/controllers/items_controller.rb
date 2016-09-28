class ItemsController < ApplicationController

  def create
  	@item = Item.new(items_params)
	if @item.save
		redirect_to "/vendors/edit"
	else
		redirect_to '/welcome/index'
	end
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy!
  	redirect_to "/vendors/edit"
  end

  private

  def items_params
    params.require(:item).permit(:title, :description, :price, :vendor_id)
  end
end
