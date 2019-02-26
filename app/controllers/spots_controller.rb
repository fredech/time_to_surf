class ApplicationController < ActionController::Base
  # before_action :set_painting, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  # skip_after_action :verify_authorized, only:[:update, :search, :index]

  def index
    @spots = Spot.where.not(latitude: nil, longitude: nil)

    @markers = @spots.map do |spot|
      {
        lng: spot.longitude,
        lat: spot.latitude
      }
    end
  end

  def show
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :photo, :video, :longitude, :latitude)
  end

end
