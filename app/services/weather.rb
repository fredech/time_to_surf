require 'json'
require 'open-uri'

def weather_condition(spot, hour_searched)
  api_key = ENV['WEATHER_API_KEY']
  api_key_msw = ENV['MAGICSEAWEED_API_KEY']
  lat = spot.latitude
  long = spot.longitude
  msw_id = spot.msw_id
# def weather_condition(hour_searched)
  # api_key = "2e9f60ab2bdf4bda881161945192502"
  # api_key_msw = "jWD770v2Kp3d2VKW12l0o4TVuYrb555r"
  # lat = "47.84"
  # long = "-4.35"
  # msw_id = '1531'

  url = "http://api.worldweatheronline.com/premium/v1/marine.ashx?key=#{api_key}&format=json&q=#{lat},#{long}&tide=yes"
  url_serialized = open(url).read
  spot_weather = JSON.parse(url_serialized)

  url_msw = "http://magicseaweed.com/api/#{api_key_msw}/forecast/?spot_id=#{msw_id}&units=eu&fields=timestamp,solidRating,fadedRating"
  url_msw_serialized = open(url_msw).read
  spot_wave_conditions = JSON.parse(url_msw_serialized)

  result = {}

  hour = define_hour(hour_searched)

  result[:date] = spot_weather["data"]["weather"][0]["date"]
  result[:sunrise] = spot_weather["data"]["weather"][0]["astronomy"][0]["sunrise"]
  result[:sunset] = spot_weather["data"]["weather"][0]["astronomy"][0]["sunset"]
  result[:air_temperature] = spot_weather["data"]["weather"][0]["hourly"][hour]["tempC"]
  result[:water_temperature] = spot_weather["data"]["weather"][0]["hourly"][hour]["waterTemp_C"]
  result[:wind_speed] = spot_weather["data"]["weather"][0]["hourly"][hour]["windspeedKmph"]
  result[:wind_direction] = spot_weather["data"]["weather"][0]["hourly"][hour]["winddirDegree"]
  result[:wind_direction_string] = spot_weather["data"]["weather"][0]["hourly"][hour]["winddir16Point"]
  result[:weather_icon] = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherIconUrl"][0]["value"]
  result[:weather_description] = spot_weather["data"]["weather"][0]["hourly"][hour]["weatherDesc"][0]["value"]
  result[:swell_height] = spot_weather["data"]["weather"][0]["hourly"][hour]["swellHeight_m"]
  result[:swell_direction] = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir"]
  result[:swell_direction_string] = spot_weather["data"]["weather"][0]["hourly"][hour]["swellDir16Point"]
  result[:swell_period] = spot_weather["data"]["weather"][0]["hourly"][hour]["swellPeriod_secs"]
  result[:tide_1_time] = spot_weather["data"]["weather"][0]["tides"][0]["tide_data"][1]["tideTime"]
  result[:tide_1_low_or_high] = spot_weather["data"]["weather"][0]["tides"][0]["tide_data"][1]["tide_type"]
  result[:tide_2_time] = spot_weather["data"]["weather"][0]["tides"][0]["tide_data"][2]["tideTime"]
  result[:tide_2_low_or_high] = spot_weather["data"]["weather"][0]["tides"][0]["tide_data"][2]["tide_type"]
  result[:faded_rating] = spot_wave_conditions[hour]["fadedRating"]
  result[:solid_rating] = spot_wave_conditions[hour]["solidRating"]

  return result
end

def define_hour(hour_searched)
   elements = { "0h" => 0, "3h" => 1, "6h" => 2, "9h" => 3, "12h" => 4, "15h" => 5, "18h" => 6, "21h" => 7 }
   return elements[hour_searched]
end

def spots_condition(spots)
  spots_weather = {}
  spots.each do |spot|
    spots_weather[spot.name] = weather_condition(spot, "12h")
  end
  return spots_weather
end

# hour = { "0h" => 0, "3h" => 1, "6h" => 2, "9h" => 3, "12h" => 4, "15h" => 5, "18h" => 6, "21h" => 7 }
# p weather_condition("12h")


# @weather = { :date=>"2019-03-01",
#                 :sunrise=>"07:59 AM",
#                 :sunset=>"07:02 PM",
#                 :air_temperature=>"12",
#                 :water_temperature=>"11",
#                 :wind_speed=>"17",
#                 :wind_direction=>"212",
#                 :wind_direction_string=>"SSW",
#                 :weather_icon=>"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png",
#                 :weather_description=>"Partly cloudy",
#                 :swell_height=>"1.8",
#                 :swell_direction=>"260",
#                 :swell_direction_string=>"W",
#                 :swell_period=>"10.0",
#                 :tide_1_time=>"7:04 AM",
#                 :tide_1_low_or_high=>"LOW",
#                 :tide_2_time=>"1:35 PM",
#                 :tide_2_low_or_high=>"HIGH",
#                 :faded_rating=>0,
#                 :solid_rating=>2 }

