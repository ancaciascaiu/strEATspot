class LocationsController < ApplicationController

  def create
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    p params
    current_vendor.latitude = params[:lat]
    current_vendor.longitude = params[:lng]
  end

  def delete
    current_vendor.lat = nil
    current_vendor.lng = nil
  end

end
