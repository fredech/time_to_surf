# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "create Users ..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551203149/Georgette.png"
georgette = User.new(pseudo: "Georgette", email: "georgette@gmail.com", password:"topsecret", password_confirmation:"topsecret")
georgette.remote_photo_url = url
georgette.save!

puts "#{User.count} users created"

puts 'Finished!'
