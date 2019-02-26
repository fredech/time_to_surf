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

  def dashboard
    @profile = Profile.where(user: current_user)
    @surf_sessions = Surf_Session.where(user: current_user)
    @preferred_spots = Preferred_spot.where(user: current_user)
  end
end
