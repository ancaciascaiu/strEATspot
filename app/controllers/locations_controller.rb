class LocationsController < ApplicationController

  def create
    current_vendor.update(latitude: params[:lat])
    current_vendor.update(longitude: params[:lng])
    render(partial: "checked")
  end

  def delete
    current_vendor.update(latitude: nil)
    current_vendor.update(longitude: nil)
    render(partial: "uncheck")
  end

  def get
    vendors = []
    Vendor.all.each do |vendor|
      if vendor.latitude && vendor.longitude
        vendors << vendor
      end
    end
    locations = vendors.map{ |vendor| {title: vendor.username, coords: {lat: vendor.latitude, lng: vendor.longitude}} }
    render :json => locations
  end

end
