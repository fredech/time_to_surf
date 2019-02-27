class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @spots = Spot.where.not(latitude: nil, longitude: nil)
    @markers = @spots.map do |spot|
      {
        lng: spot.longitude,
        lat: spot.latitude
      }
    end
  end

  def search
    redirect_to spots_path
  end

  def dashboard
    @profile = Profile.where(user: current_user)
    @surf_sessions = SurfSession.where(user: current_user)
    @preferred_spots = PreferredSpot.where(user: current_user)
  end
end
