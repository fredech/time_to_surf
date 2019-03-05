namespace :spot do
  desc "Enriching spots with daily weather data"
  task update_all: :environment do
    spots_count = Spot.count
    puts "Updating #{spots_count} spots..."

    Spot.find_in_batches(batch_size: 500).each do |spots|
      spots.each do |spot|
        FetchWeatherConditionsService.new(spot).call
      end
    end

    puts "Finished!"
  end
end
