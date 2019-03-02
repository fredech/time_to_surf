require_relative '../services/weather.rb'
require_relative '../services/algo.rb'

def search
  param_1 = params[:search][:address]
  param_2 = params[:search][:start_time]
  param_3 = params[:search][:travel_time].to_i
  param_4 = params[:search][:level]
  @spots = Spot.near(param_1, param_3).where.not(latitude: nil, longitude: nil)
end
