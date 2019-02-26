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
end
