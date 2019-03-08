require 'date'
require 'json'
require 'open-uri'

def define_searched_date(searched_date)
  (searched_date - Date.today).to_i
end

def define_hour(hour_searched)
  elements = {
    "0h" => 0, "01h" => 0, "02h" => 0,
    "03h" => 1, "04h" => 1, "05h" => 1,
    "06h" => 2, "07h" => 2, "08h" => 2,
    "09h" => 3, "10h" => 3, "11h" => 3,
    "12h" => 4, "13h" => 4, "14h" => 4,
    "15h" => 5, "16h" => 5, "17h" => 5,
    "18h" => 6, "19h" => 6, "20h" => 6,
    "21h" => 7, "22h" => 7, "23h" => 7
  }
  return elements[hour_searched]
end

def define_hour_msw(searched_date, hour_searched)
  add_hour = define_searched_date(searched_date) * 8
  elements = {
    "0h" => 0, "01h" => 0, "02h" => 0,
    "03h" => 1, "04h" => 1, "05h" => 1,
    "06h" => 2, "07h" => 2, "08h" => 2,
    "09h" => 3, "10h" => 3, "11h" => 3,
    "12h" => 4, "13h" => 4, "14h" => 4,
    "15h" => 5, "16h" => 5, "17h" => 5,
    "18h" => 6, "19h" => 6, "20h" => 6,
    "21h" => 7, "22h" => 7, "23h" => 7
  }
  return (elements[hour_searched] + add_hour)
end

def weather_condition(spot, date, hour_searched)
  result = {}
  hour = define_hour(hour_searched)
  date_s = (date < Date.today) ? Date.today : date
  searched_date = define_searched_date(date_s)
  hour_msw = define_hour_msw(date_s, hour_searched)

  result[:date] = spot.data_weather_online["data"]["weather"][searched_date]["date"]
  result[:sunrise] = spot.data_weather_online["data"]["weather"][searched_date]["astronomy"][0]["sunrise"]
  result[:sunset] = spot.data_weather_online["data"]["weather"][searched_date]["astronomy"][0]["sunset"]
  result[:air_temperature] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["tempC"]
  result[:water_temperature] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["waterTemp_C"]
  result[:wind_speed] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["windspeedKmph"]
  result[:wind_direction] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["winddirDegree"]
  result[:wind_direction_string] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["winddir16Point"]
  result[:weather_icon] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["weatherIconUrl"][0]["value"]
  result[:weather_description] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["weatherDesc"][0]["value"]
  result[:swell_height] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["swellHeight_m"]
  result[:swell_direction] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["swellDir"]
  result[:swell_direction_string] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["swellDir16Point"]
  result[:swell_period] = spot.data_weather_online["data"]["weather"][searched_date]["hourly"][hour]["swellPeriod_secs"]
  result[:tide_1_time] = spot.data_weather_online["data"]["weather"][searched_date]["tides"][0]["tide_data"][1]["tideTime"]
  result[:tide_1_low_or_high] = spot.data_weather_online["data"]["weather"][searched_date]["tides"][0]["tide_data"][1]["tide_type"]
  result[:tide_2_time] = spot.data_weather_online["data"]["weather"][searched_date]["tides"][0]["tide_data"][2]["tideTime"]
  result[:tide_2_low_or_high] = spot.data_weather_online["data"]["weather"][searched_date]["tides"][0]["tide_data"][2]["tide_type"]
  result[:faded_rating] = spot.data_msw[hour_msw]["fadedRating"]
  result[:solid_rating] = spot.data_msw[hour_msw]["solidRating"]

  return result
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

def weather_condition_fixed
  @weather = { :date=>"2019-03-01",
               :sunrise=>"07:59 AM",
               :sunset=>"07:02 PM",
               :air_temperature=>"12",
               :water_temperature=>"11",
               :wind_speed=>"17",
               :wind_direction=>"212",
               :wind_direction_string=>"SSW",
               :weather_icon=>"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png",
               :weather_description=>"Partly cloudy",
               :swell_height=>"1.8",
               :swell_direction=>"260",
               :swell_direction_string=>"W",
               :swell_period=>"10.0",
               :tide_1_time=>"7:04 AM",
               :tide_1_low_or_high=>"LOW",
               :tide_2_time=>"1:35 PM",
               :tide_2_low_or_high=>"HIGH",
               :faded_rating=>0,
               :solid_rating=>2
  }
end

# puts weather_condition(Date.parse("2019-03-4"), "12h")
