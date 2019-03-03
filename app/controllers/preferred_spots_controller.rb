class PreferredSpotsController < ApplicationController
  def create
    @preferred_spot = PreferredSpot.new
    @preferred_spot.user = current_user
    @preferred_spot.spot = Spot.find(params[:spot_id])
    @preferred_spot.save!
    redirect_back(fallback_location: dashboard_path)
  end

  def destroy
    @preferred_spot = PreferredSpot.where(user_id: current_user).find_by_spot_id(params[:id])
    @preferred_spot.destroy
    redirect_back(fallback_location: dashboard_path)
    # redirect_to spots_path(start_time: params[:start_time], travel_time: params[:travel_time], address: params[:address])
  end

  def Preferred_Spot_params
    params.require(:preferred_spot).permit(:spot_id, :user_id, :id)
  end
end
