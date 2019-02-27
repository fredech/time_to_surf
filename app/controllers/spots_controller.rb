class SpotsController < ApplicationController
  # before_action :set_spot, only: [:show, :index]
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
  end

  def show
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :photo, :video, :longitude, :latitude, :seabed, :best_tide, :difficulty_level)
  end

end
