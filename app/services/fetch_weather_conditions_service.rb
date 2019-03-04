# require_relative 'app/services/weather2'
# weather_condition(Spot.first, "12h")
#load 'app/services/fetch_weather_conditions_service.rb'

# FetchWeatherConditionsService.new(Spot.last).call

class FetchWeatherConditionsService
  def initialize(spot)
    @spot = spot
  end

  def call

    api_key = ENV['WEATHER_API_KEY']
    api_key_msw = ENV['MAGICSEAWEED_API_KEY']
    lat = @spot.latitude
    long = @spot.longitude
    msw_id = @spot.msw_id

    url = "http://api.worldweatheronline.com/premium/v1/marine.ashx?key=#{api_key}&format=json&q=#{lat},#{long}&tide=yes"
    url_serialized = open(url).read
    spot_weather = JSON.parse(url_serialized)
    @spot.data_weather_online = spot_weather
    @spot.save!

    url_msw = "http://magicseaweed.com/api/#{api_key_msw}/forecast/?spot_id=#{msw_id}&units=eu&fields=timestamp,solidRating,fadedRating"
    url_msw_serialized = open(url_msw).read
    spot_wave_conditions = JSON.parse(url_msw_serialized)
    @spot.data_msw = spot_wave_conditions
    @spot.save!

  end

  private

  def sous_traitance
  end
end
