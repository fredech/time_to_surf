# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy datas..."
User.destroy_all
Spot.destroy_all
puts "Datas destroyed!"

puts "create Users..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551203149/Georgette.png"
georgette = User.new(pseudo: "Georgette", email: "georgette@gmail.com", password:"topsecret", password_confirmation:"topsecret")
georgette.remote_photo_url = url
georgette.save!

puts "#{User.count} users created"

puts "create Spots..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551275874/Lesconil.jpg"
url2= "blob:https://www.youtube.com/14c8905b-8a7f-48d5-9e21-4389bd77549c"
spot_one = Spot.new(name: 'Lesconil', address: "Anse de Lesconil, Lesconil",
                    description: "This stretch of coast, including nearby Benodet and Beg Meil, requires a rare combination of S swell and N winds to provide anything else than windsurf conditions. When on, a reef close to the harbour offers hollow, powerful, low tide lefts and some lesser rights.",
                    seabed: "Unever reef and sand", best_tide: "Low Mid",
                    difficulty_level: 4.5,
                    msw_id: 1534 )
spot_one.remote_photo_url = url
spot_one.video = url2
spot_one.save!

puts "#{Spot.count} spots created"

puts 'Finished!'
