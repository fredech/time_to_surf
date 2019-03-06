require_relative '../services/weather.rb'
require_relative '../services/algo.rb'

class SpotsController < ApplicationController
  before_action :set_spot, only: [:show]
  # skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  # skip_after_action :verify_authorized, only:[:update, :search, :index]

  def index
    @start_time = set_params(:start_time)

    date_str, hour = @start_time.split(' ')
    @date = date_str ? Date.parse(date_str) : Date.today
    @hour = hour ? hour.gsub(/:\d+/, "h") : "12h"

    @address = set_params(:address)

    set_travel_time

    @level = set_params(:level)

    set_preferred_spots
    set_spots
    set_ratings_n_markers

  end

  def show
    @address = set_params(:address)
    @address = current_user.profile.address if @address.nil?

    @start_time = set_params(:start_time)
    if @start_time.nil?
      @date = Date.today
      @hour = "12h"
    else
      date_str, hour = @start_time.split(' ')
      hour = hour.first(5)
      @date = Date.parse(date_str)
      @hour = hour.gsub(/:\d+/, "h")
    end

    @address_coordinates = Geocoder.search(@address).first.coordinates

    @preferred_spots = set_preferred_spots

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

    @markers = [
      {
        lat: @address_coordinates[0],
        lng: @address_coordinates[1],
        image_url: helpers.asset_url('start_pin.png')
      },
      {
        lng: @spot.longitude,
        lat: @spot.latitude,
        image_url: helpers.asset_url('surfing_silhouette.png')
      }
    ]
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :photo, :video, :longitude, :latitude, :seabed, :best_tide, :difficulty_level)
  end

  def set_spots
    @geocoding_search = Geocoder.search(@address).first

    if @geocoding_search
      @address_coordinates = @geocoding_search.coordinates
      @spots = Spot.near(@address_coordinates, @travel_time).where.not(latitude: nil, longitude: nil)
    else
      @spots = Spot.near(@address, @travel_time).where.not(latitude: nil, longitude: nil)
    end
  end

  def set_travel_time
    if params[:search][:travel_time].blank?
      @travel_time = 30
    elsif params[:search][:start_time].empty?
      @travel_time = 101
    else
      @travel_time = set_params(:travel_time).to_i
    end
  end

  def set_preferred_spots
    pref = PreferredSpot.where(user_id: current_user)
    @preferred_spots = []
    pref.each do |p|
      @preferred_spots << p.spot
    end
    @preferred_spots
  end

  def set_params(element)
    params[:search].nil? ? params[element] : params[:search][element]
  end

  def set_selected_spots
    @selected_spots = []
    if @start_time.empty?
      @selected_spots = @spots
    else
      @selected_spots << Spot.find(@global_rating[2][0]) << Spot.find(@global_rating[1][0]) << Spot.find(@global_rating[0][0])
    end
  end

  def set_ratings_n_markers
    @rating_tide = {}
    @rating_wave_msw = {}
    @rating_spot_difficulty = {}
    @rating_swell = {}
    @overall_rating = {}
    @global_rating = {}

    if @spots.empty?
      redirect_to root_path, notice: 'No surfing spot around this place'
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

      set_selected_spots

      @markers = @selected_spots.map do |spot|
        {
          lng: spot.longitude,
          lat: spot.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
          image_url: helpers.asset_url('surfing_silhouette.png'),
          spot: spot.id
        }
      end
    end
  end
end
