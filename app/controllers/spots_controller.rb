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
    if @spots.empty?
      render 'pages/home', alert: 'The form have to be fully commpleted!'
    else
      @spots.each do |spot|
        # weather = weather_condition(spot, searched_hour)
        weather = weather_condition_fixed
        @conditions_rates["#{spot.id}"] = conditions_rate(spot, "12h", weather)
        @matching_rates["#{spot.id}"] = matching_rate(spot, current_user, "12h", weather)
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
    @address = set_params(:address)
    @start_time = set_params(:start_time)
    @travel_time = set_params(:travel_time).to_i
    @level = current_user.profile.level
    @preferred_spots = set_preferred_spots
  end

  def show
    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          image_url: helpers.asset_url('map_pin.png')
    }]

    # @weather = weather_condition(@spot, "12h")
    @weather = weather_condition_fixed

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

  def set_preferred_spots
    pref = PreferredSpot.where(user_id: current_user)
    array = []
    pref.each do |p|
      array << p.spot
    end
    array
  end

  def set_params(element)
    params[:search].nil? ? @element = params[:element] : @element = params[:search][:element]
  end
end
