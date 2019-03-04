# require_relative 'app/services/weather2'
# weather_condition(Spot.first, "12h")
#load 'app/services/fetch_weather_conditions_service.rb'

# FetchWeatherConditionsService.new(Spot.last).call

class FetchWeatherConditionsService
  def initialize(spot)
    @spot = spot
  end

  def call
    @spot.data_weather_online = fetch_weather
    @spot.data_msw = fetch_wave_conditions
    @spot.save!
  end

  private

  def fetch_weather
    api_key = ENV['WEATHER_API_KEY']
    url = "http://api.worldweatheronline.com/premium/v1/marine.ashx?key=#{api_key}&format=json&q=#{@spot.latitude},#{@spot.longitude}&tide=yes"
    url_serialized = open(url).read

    return JSON.parse(url_serialized)
  end

  def fetch_wave_conditions
    api_key_msw = ENV['MAGICSEAWEED_API_KEY']
    url_msw = "http://magicseaweed.com/api/#{api_key_msw}/forecast/?spot_id=#{@spot.msw_id}&units=eu&fields=timestamp,solidRating,fadedRating"
    url_msw_serialized = open(url_msw).read

    return JSON.parse(url_msw_serialized)
  end
end
