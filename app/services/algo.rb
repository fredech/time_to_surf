require_relative './weather.rb'
require 'time'

def conditions_rate(spot, searched_hour)
  weather = weather_condition(spot.latitude, spot.longitude, searched_hour)
  weather_tide = weather_tide(weather, searched_hour)
  spot_tide = spot.best_tide
  rate_tide = rate_tide(weather_tide, spot_tide)

  rate_msw = weather[:solid_rating] * 3 / 5

  return rate_tide + rate_msw
end

def matching_rate(spot, user, searched_hour)
  weather = weather_condition(spot.latitude, spot.longitude, searched_hour)
  swell_height = weather[:swell_height].to_i
  level_user = user.profile.level
  rate_swell = rate_swell(swell_height, level_user)

  difficulty = spot.difficulty_level
  rate_difficulty = rate_difficulty(difficulty, level_user)

  return rate_swell + rate_difficulty
end

private

def weather_tide(weather, searched_hour)
  if weather[:tide_1_low_or_high] == "LOW"
    h0 = Time.parse(weather[:tide_1_time])
    h2 = Time.parse(weather[:tide_2_time])
  else
    h0 = Time.parse(weather[:tide_2_time])
    h2 = Time.parse(weather[:tide_1_time])
  end
  duration = ((h2 - h0) / 1.hour).round
  h1 = Time.parse(searched_hour)
  surf_time = ((h1 - h0) / 1.hour).round
  if surf_time < (duration / 2)
    return "Low Mid"
  else
    return "Mid High"
  end
end

def rate_tide(weather_tide, spot_tide)
  if spot_tide == "All"
    return 2
  elsif spot_tide == weather_tide
    return 2
  else
    return 0
  end
end

def rate_swell(swell, level)
  if level == "Beginner"
    if swell >= 1.5
      return 0
    elsif swell >= 1
      return 1
    else
      return 3
    end
  elsif level == "Intermediate"
    if swell >= 2
      return 0
    elsif swell >= 1.5
      return 1
    elsif swell >= 1
      return 3
    else
      return 2
    end
  elsif level == "Advanced"
    if swell >= 2
      return 1
    elsif swell >= 1.5
      return 3
    elsif swell >= 1
      return 2
    else
      return 1
    end
  else
    if swell >= 2
      return 3
    elsif swell >= 1.5
      return 2
    elsif swell >= 1
      return 2
    else
      return 1
    end
  end
end

def rate_difficulty(difficulty, level)
  if level == "Beginner"
    if difficulty >= 3
      return 0
    elsif difficulty == 2
      return 1
    else
      return 2
    end
  elsif level == "Intermediate"
    if difficulty >= 4
      return 0
    elsif difficulty == 3
      return 1
    elsif difficulty == 2
      return 2
    else
      return 1
    end
  elsif level == "Advanced"
    if difficulty >= 5
      return 0
    elsif difficulty == 4
      return 1
    elsif difficulty == 3
      return 2
    elsif difficulty == 2
      return 1
    else
      return 0
    end
  else
    if difficulty >= 4
      return 2
    elsif difficulty == 3
      return 1
    else
      return 0
    end
  end
end
