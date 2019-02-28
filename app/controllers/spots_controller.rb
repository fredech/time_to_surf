require_relative '../services/weather.rb'
require_relative '../services/algo.rb'

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
    # @conditions_rates = {}
    # @matching_rates = {}
    # @spots.each do |spot|
    #   @conditions_rates["#{spot.id}"] = conditions_rate(spot, "12h")
    #   @matching_rates["#{spot.id}"] = matching_rate(spot, current_user, "12h")
    # end
  end

  def show
    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          image_url: helpers.asset_url('map_pin.png')
        }]
    @weather = weather_condition(@spot, "12h")
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
