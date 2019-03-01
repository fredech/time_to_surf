def search
  if params[:spot][:address].empty? || params[:spot][:start_time].empty? || params[:spot][:travel_time].empty? || params[:spot][:level].empty?
    redirect_to root_path, notice: 'The form have to be fully commpleted!'
  else
    param_1 = "%#{params[:spot][:address]}%"
    param_2 = "%#{params[:spot][:start_time]}%"
    param_3 = "%#{params[:spot][:travel_time]}%"
    param_4 = "%#{params[:spot][:level]}%"
    @spots = Spot.near(param_1, param_3).where.not(latitude: nil, longitude: nil)
  end
end
