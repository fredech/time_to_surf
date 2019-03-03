class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.user = current_user
    @profile.address = params[:address]
    @profile.level = params[:level]
    if @profile.save!
      redirect_to dashboard_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to dashboard_path, notice: 'Profile was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find_by_user_id(current_user)
  end

  def profile_params
    params.require(:profile).permit(:level, :address, :longitude, :latitude, :user_id)
  end
end
