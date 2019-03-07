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
    # @spot = Spot.find(params[:id])
    # # @current_user.preferred_spots.pluck(:preferred_spot_id) = @preferred_spot.id
    # if @preferred_spot.destroy
    #   respond_to do |format|
    #     format.html { redirect_to dashboard_path }
    #     format.js { } # <-- will render `app/views/reviews/create.js.erb`
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render 'dashboard' }
    #     format.js  { } # <-- idem
    #   end
    # end
    # redirect_back(fallback_location: dashboard_path)
    # redirect_to spots_path(start_time: params[:start_time], travel_time: params[:travel_time], address: params[:address])
  end

  def Preferred_Spot_params
    params.require(:preferred_spot).permit(:spot_id, :user_id, :id)
  end
end
