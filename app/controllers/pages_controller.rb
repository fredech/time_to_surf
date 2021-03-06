class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @level = set_level
    @markers = set_markers([Spot.first])
  end

  def dashboard
    @profile = Profile.where(user: current_user)
    @surf_sessions = SurfSession.where(user: current_user)
    @preferred_spots = PreferredSpot.where(user: current_user)
    @level = set_level
    @review = Review.new
    @user_preferred_real_spots = Spot.where(id: current_user.preferred_spots.pluck(:spot_id))
    @address = set_params(:address)
    @start_time = set_params(:start_time)
    @travel_time = set_params(:travel_time)
  end

  private

  def set_level
    if user_signed_in?
      if Profile.exists?(user_id: current_user)
        if current_user.profile.level.nil? == false
          return current_user.profile.level
        end
      end
    else
      return "Beginner"
    end
  end

  def set_markers(spots)
    markers = spots.map do |spot|
      {
        lng: spot.longitude,
        lat: spot.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url('surfing_silhouette_gray.png')
      }
    end
  end

  def set_params(element)
    params[:search].nil? ? params[element] : params[:search][element]
  end
end
