class LocationsController < ApplicationController

  def create
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    p params
    current_vendor.update(latitude: params[:lat])
    current_vendor.update(longitude: params[:lng])
    render(partial: "checked")
  end

  def delete
    current_vendor.update(latitude: nil)
    current_vendor.update(longitude: nil)
    render(partial: "uncheck")
  end

end
