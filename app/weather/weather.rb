require 'json'
require 'open-uri'

def weather_condition(lat, long, hour)
  api_key = '2e9f60ab2bdf4bda881161945192502'
  url = "http://api.worldweatheronline.com/premium/v1/marine.ashx?key=#{api_key}&format=json&q=#{lat},#{long}"
  url_serialized = open(url).read
  spot_weather = JSON.parse(url_serialized)
  result = {}

  sunrise = spot_weather["data"]["weather"][0]["astronomy"][0]["sunrise"]
  result[:sunrise] = sunrise

  sunset = spot_weather["data"]["weather"][0]["astronomy"][0]["sunset"]
  result[:sunset] = sunset

  air_temperature = spot_weather["data"]["weather"][0]["hourly"][hour]["tempC"]
  result[:air_temperature] = air_temperature

  water_temperature = spot_weather["data"]["weather"][0]["hourly"][hour]["waterTemp_C"]
  result[:water_temperature] = water_temperature

  wind_speed = spot_weather["data"]["weather"][0]["hourly"][hour]["windspeedKmph"]
  result[:wind_speed] = wind_speed

  wind_direction = spot_weather["data"]["weather"][0]["hourly"][hour]["winddirDegree"]
  result[:wind_direction] = wind_direction

  wind_direction_string = spot_weather["data"]["weather"][0]["hourly"][hour]["winddir16Point"]
  result[:wind_direction_string] = wind_direction_string

  weather_icon = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherIconUrl"][0]["value"]
  result[:weather_icon] = weather_icon

  weather_description = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherDesc"][0]["value"]
  result[:weather_description] = weather_description

  swell_height = spot_weather["data"]["weather"][0]["hourly"][hour]["swellHeight_m"]
  result[:swell_height] = swell_height

  swell_direction = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir"]
  result[:swell_direction] = swell_direction

  swell_direction_string = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir16Point"]
  result[:swell_direction_string] = swell_direction_string

  swell_period = spot_weather["data"]["weather"][0]["hourly"][hour]["swellPeriod_secs"]
  result[:swell_period] = swell_period

  return result
end

# hour = { "0h" => 0, "3h" => 1, "6h" => 2, "9h" => 3, "12h" => 4, "15h" => 5, "18h" => 6, "21h" => 7 }
# weather_condition("47.84", "-4.35", hour["12h"])
