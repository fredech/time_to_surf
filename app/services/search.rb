def search()
  if params[:spot][:location].empty? || params[:spot][:start_time].empty? || params[:spot][:travel_time].empty?
    refresh
  else
    param_1 = "%#{params[:spot][:location]}%"
    param_2 = "%#{params[:spot][:start_time]}%"
    param_3 = "%#{params[:spot][:travel_time]}%"
    param_3 = "%#{params[:spot][:level]}%"
    @spots = Spot.near(param1, param_3)
  end
end
