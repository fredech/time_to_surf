class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @level = set_level
  end

  def dashboard
    @profile = Profile.where(user: current_user)
    @surf_sessions = SurfSession.where(user: current_user)
    @preferred_spots = PreferredSpot.where(user: current_user)
    @level = set_level
    @review = Review.new
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
end
