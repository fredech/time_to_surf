require_relative '../services/weather.rb'
require_relative '../services/algo.rb'
require_relative '../services/search.rb'

class SpotsController < ApplicationController
  before_action :set_spot, only: [:show]
  # skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  # skip_after_action :verify_authorized, only:[:update, :search, :index]

  def index

    date_str, hour = params[:search][:start_time].split(' ')

    @date = Date.parse(date_str)
    @hour = hour.gsub(/:\d+/, "h")

    search

    @rating_tide = {}
    @rating_wave_msw = {}
    @rating_spot_difficulty = {}
    @rating_swell = {}
    @global_rating = {}

    if @spots.empty?
      render 'pages/home', alert: 'The form have to be fully commpleted!'
    else
      @spots.each do |spot|
        weather = weather_condition(spot, @date, @hour)

        @rating_tide["#{spot.id}"] = tide(spot, @hour, weather)
        @rating_wave_msw["#{spot.id}"] = wave_msw(weather)
        @rating_spot_difficulty["#{spot.id}"] = spot_difficulty(spot, current_user)
        @rating_swell["#{spot.id}"] = swell(weather, current_user)
        @global_rating["#{spot.id}"] = overall_rating(spot, @hour, weather, current_user)

        # @conditions_rates["#{spot.id}"] = conditions_rate(spot, hour, weather)
        # @matching_rates["#{spot.id}"] = matching_rate(spot, current_user, weather)
      end

      @global_rating = @global_rating.sort_by { |spot, rate| rate }.last(3)
      @selected_spots = []
      @selected_spots << Spot.find(@global_rating[0][0]) << Spot.find(@global_rating[1][0]) << Spot.find(@global_rating[2][0])
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
    params[:search][:travel_time].nil? ? @travel_time = 30 : @travel_time = set_params(:travel_time).to_i
    @level = set_params(:level)
    @preferred_spots = set_preferred_spots
  end

  def show

    @address = set_params(:address)
    @start_time = set_params(:start_time)
    @rating_tide = set_params(:rating_tide)
    @rating_wave_msw = set_params(:rating_wave_msw)
    @rating_spot_difficulty = set_params(:rating_spot_difficulty)
    @rating_swell = set_params(:rating_swell)
    @global_rating = set_params(:global_rating)
    @date = set_params(:date)
    @hour = set_params(:hour)

    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          image_url: helpers.asset_url('map_pin.png')
    }]

    @weather = weather_condition(@spot, Date.parse(@date), @hour)

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
    params[:search].nil? ? params[element] : params[:search][element]
  end
end
