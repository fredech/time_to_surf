class ProfilesController < ApplicationController

  def create
    @profile = Profile.new
    @profile.user = current_user
    @profile.address = params[:address]
    @profile.level = params[:level]
    @profile.save!
    redirect_back(fallback_location: dashboard_path)
  end

  def edit
    @profile = Profile.find_by_user_id(current_user)
  end

  def update

  end
end
