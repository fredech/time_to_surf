require_relative './weather.rb'
require 'time'

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

def tide(spot, searched_hour, weather)
  weather_tide = weather_tide(weather, searched_hour)
  spot_tide = spot.best_tide
  rate_tide(weather_tide, spot_tide)
end

def wave_msw(weather)
  rate_msw = weather[:solid_rating] * 3 / 5
end

def spot_difficulty(spot, user)
  difficulty = spot.difficulty_level
  level_user = set_level
  rate_difficulty = rate_difficulty(difficulty, level_user)
end

def swell(weather, user)
  swell_height = weather[:swell_height].to_i
  level_user = set_level
  rate_swell = rate_swell(swell_height, level_user)
end

def overall_rating(spot, searched_hour, weather, user)
  p rating_tide = tide(spot, searched_hour, weather) * 10
  p rating_wave_msw = wave_msw(weather) * 10
  p rating_spot_difficulty = spot_difficulty(spot, user) * 10
  p rating_swell = swell(weather, user) * 10
  p global_rating = rating_tide + rating_wave_msw + rating_spot_difficulty + rating_swell
end

private

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

def rate_tide(weather_tide, spot_tide)
  if spot_tide == "All"
    return 2
  elsif spot_tide == weather_tide
    return 2
  else
    return 0
  end
end

# def conditions_rate(spot, searched_hour, weather)
#   weather_tide = weather_tide(weather, searched_hour)
#   spot_tide = spot.best_tide
#   rate_tide = rate_tide(weather_tide, spot_tide)

#   rate_msw = weather[:solid_rating] * 3 / 5

#   return rate_tide + rate_msw
# end

# def matching_rate(spot, user, weather)
#   swell_height = weather[:swell_height].to_i
#   level_user = set_level
#   rate_swell = rate_swell(swell_height, level_user)

#   difficulty = spot.difficulty_level
#   rate_difficulty = rate_difficulty(difficulty, level_user)

#   return rate_swell + rate_difficulty
# end

def set_level
  if user_signed_in?
    if Profile.exists?(user_id: current_user)
      if current_user.profile.level.nil? == false
        return level = current_user.profile.level
      end
    end
  else
    return level = "Beginner"
  end
end
