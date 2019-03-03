class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @level = current_user.profile.level if user_signed_in?
  end

  def dashboard
    @profile = Profile.where(user: current_user)
    @surf_sessions = SurfSession.where(user: current_user)
    @preferred_spots = PreferredSpot.where(user: current_user)
  end
end
