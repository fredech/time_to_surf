require_relative '../weather/weather.rb'

class SpotsController < ApplicationController
  before_action :set_spot, only: [:show]
  # skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  # skip_after_action :verify_authorized, only:[:update, :search, :index]

  def index
    # @spots = Spot.where(query)
    # @markers = @spots.map do |spot|
    #   {
    #     lng: painting.longitude,
    #     lat: painting.latitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
    #     image_url: helpers.asset_url('map_pin.png')
    #   }
    # end
    @spots = Spot.where.not(latitude: nil, longitude: nil)

    @markers = @spots.map do |spot|
      {
        lng: spot.longitude,
        lat: spot.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url('map_pin.png')
      }
    end
  end

  def show
    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { spot: @spot }),
          image_url: helpers.asset_url('map_pin.png')
        }]
    @weather = weather_condition(@spot.latitude, @spot.longitude, "12h")
    d = DateTime.now
    @date = d.next_day.strftime("%d/%m/%Y")
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :photo, :video, :longitude, :latitude, :seabed, :best_tide, :difficulty_level)
  end

end
