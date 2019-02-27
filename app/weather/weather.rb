require 'json'
require 'open-uri'


def weather_condition_at_12(lat, long, hour)

  api_key = '2e9f60ab2bdf4bda881161945192502'
  url = "http://api.worldweatheronline.com/premium/v1/marine.ashx?key=#{api_key}&format=json&q=#{lat},#{long}"
  url_serialized = open(url).read
  spot_weather = JSON.parse(url_serialized)

  sunrise = spot_weather["data"]["weather"][0]["astronomy"][0]["sunrise"]
  p sunrise

  sunset = spot_weather["data"]["weather"][0]["astronomy"][0]["sunset"]
  p sunset

  # à midi
  air_temperature = spot_weather["data"]["weather"][0]["hourly"][hour]["tempC"]
  p air_temperature

  water_temperature = spot_weather["data"]["weather"][0]["hourly"][hour]["waterTemp_C"]
  p water_temperature

  wind_speed = spot_weather["data"]["weather"][0]["hourly"][hour]["windspeedKmph"]
  p wind_speed

  wind_direction = spot_weather["data"]["weather"][0]["hourly"][hour]["winddirDegree"]
  p wind_direction

  wind_direction_string = spot_weather["data"]["weather"][0]["hourly"][hour]["winddir16Point"]
  p wind_direction_string

  weather_icon = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherIconUrl"][0]["value"]
  p weather_icon

  weather_description = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherDesc"][0]["value"]
  p weather_description

  swell_height = spot_weather["data"]["weather"][0]["hourly"][hour]["swellHeight_m"]
  p swell_height

  swell_direction = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir"]
  p swell_direction

  swell_direction_string = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir16Point"]
  p swell_direction_string

  swell_period = spot_weather["data"]["weather"][0]["hourly"][hour]["swellPeriod_secs"]
  p swell_period
end

hour = { "0h" => 0, "3h" => 1, "6h" => 2, "9h" => 3, "12h" => 4, "15h" => 5, "18h" => 6, "21h" => 7 }
weather_condition_at_12("47.84", "-4.35", hour["12h"])
