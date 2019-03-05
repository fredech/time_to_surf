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
    @overall_rating = {}
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
        @overall_rating["#{spot.id}"] = overall_rating(spot, @hour, weather, current_user)

      end

      @global_rating = @overall_rating.sort_by { |spot, rate| rate }.last(3)

      @selected_spots = []
      @selected_spots << Spot.find(@global_rating[2][0]) << Spot.find(@global_rating[1][0]) << Spot.find(@global_rating[0][0])

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

    date_str, hour = set_params(:start_time).split(' ')

    @date = Date.parse(date_str)
    hour = hour.first(5)
    @hour = hour.gsub(/:\d+/, "h")


    @rating_tide = {}
    @rating_wave_msw = {}
    @rating_spot_difficulty = {}
    @rating_swell = {}
    @overall_rating = {}


    @weather = weather_condition(@spot, @date, @hour)

    @rating_tide["#{@spot.id}"] = tide(@spot, @hour, @weather)
    @rating_wave_msw["#{@spot.id}"] = wave_msw(@weather)
    @rating_spot_difficulty["#{@spot.id}"] = spot_difficulty(@spot, current_user)
    @rating_swell["#{@spot.id}"] = swell(@weather, current_user)
    @overall_rating["#{@spot.id}"] = overall_rating(@spot, @hour, @weather, current_user)

    @markers = [{
          lng: @spot.longitude,
          lat: @spot.latitude,
          image_url: helpers.asset_url('map_pin.png')
    }]

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
