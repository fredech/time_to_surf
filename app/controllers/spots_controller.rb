require_relative '../services/weather.rb'
require_relative '../services/algo.rb'
require_relative '../services/search.rb'

class SpotsController < ApplicationController
  before_action :set_spot, only: [:show]
  # skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  # skip_after_action :verify_authorized, only:[:update, :search, :index]

  def index
    search
    @conditions_rates = {}
    @matching_rates = {}
    @spots.each do |spot|
      @conditions_rates["#{spot.id}"] = conditions_rate(spot, "12h")
      @matching_rates["#{spot.id}"] = matching_rate(spot, current_user, "12h")
    end
    @matching_rates = @matching_rates.sort_by { |spot, rate| rate }.last(3)
    @selected_spots = []
    @selected_spots << Spot.find(@matching_rates[0][0]) << Spot.find(@matching_rates[1][0]) << Spot.find(@matching_rates[2][0])
    @markers = @selected_spots.map do |spot|
      {
        lng: spot.longitude,
        lat: spot.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url('map_pin.png')
      }
    end
  end

  def show

    # @spots = Spot.all
    # @spots_weather = spots_condition(@spots)

    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { spot: @spot }),
          image_url: helpers.asset_url('map_pin.png')
        }]

    @weather = weather_condition(@spot, "12h")
    # @weather = {:date=>"2019-03-01",
    #             :sunrise=>"07:59 AM",
    #             :sunset=>"07:02 PM",
    #             :air_temperature=>"12",
    #             :water_temperature=>"11",
    #             :wind_speed=>"17",
    #             :wind_direction=>"212",
    #             :wind_direction_string=>"SSW",
    #             :weather_icon=>"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png",
    #             :weather_description=>"Partly cloudy",
    #             :swell_height=>"1.8",
    #             :swell_direction=>"260",
    #             :swell_direction_string=>"W",
    #             :swell_period=>"10.0",
    #             :tide_1_time=>"7:04 AM",
    #             :tide_1_low_or_high=>"LOW",
    #             :tide_2_time=>"1:35 PM",
    #             :tide_2_low_or_high=>"HIGH",
    #             :faded_rating=>0,
    #             :solid_rating=>2 }

    # d = DateTime.now
    # @date = d.next_day.strftime("%d/%m/%Y")
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :photo, :video, :longitude, :latitude, :seabed, :best_tide, :difficulty_level)
  end

end
