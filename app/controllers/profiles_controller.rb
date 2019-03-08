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
    # @address = set_params(:address)
    # @start_time = set_params(:start_time)
    # @travel_time = set_params(:travel_time)
  end

  def update
    # @address = set_params(:address)
    # @start_time = set_params(:start_time)
    # @travel_time = set_params(:travel_time)

    if @profile.update(profile_params)
      redirect_to dashboard_path(address: @address, start_time: @start_time, travel_time: @travel_time), notice: 'Profile was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_profile
    if current_user.profile.nil?
      @profile = Profile.new(level: "Beginner")
      @profile.user = current_user
      @profile.save!
    else
      @profile = Profile.find_by_user_id(current_user)
    end
  end

  def profile_params
    params.require(:profile).permit(:level, :address, :longitude, :latitude, :user_id)
  end

  def set_params(element)
    params[:search].nil? ? params[element] : params[:search][element]
  end
end
