class PreferredSpotsController < ApplicationController
  def create
    @preferred_spot = PreferredSpot.new
    @preferred_spot.user = current_user
    @preferred_spot.spot = Spot.find(params[:spot_id])
    @preferred_spot.save!
    redirect_back fallback_location: dashboard_path, notice: 'This spot has been added to your favorites!'
  end

  def destroy
    @address = set_params(:address)
    @start_time = set_params(:start_time)
    @travel_time = set_params(:travel_time)

    @preferred_spot = PreferredSpot.where(user_id: current_user).find_by_spot_id(params[:id])
    @preferred_spot.destroy
    redirect_back fallback_location: dashboard_path, notice: 'This spot has been removed from your favorites!'
  end

  def Preferred_Spot_params
    params.require(:preferred_spot).permit(:spot_id, :user_id, :id)
  end

  def set_params(element)
    params[:search].nil? ? params[element] : params[:search][element]
  end
end
