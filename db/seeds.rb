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
spot_1.remote_photo_url = url
spot_1.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283963/pors_carn.jpg"
spot_2 = Spot.new(name: 'Pors Carn', address: "Pors carn, Penmarch",
                    description: "Just next to La Torche there’s an under-rated beachbreak and a righthand reef at high tide. Gets, hollow and wedgey, attracting more bodyboarders and the southern corner works on SW winds. The curve of the beach means NE is also ok and it is best around mid tide. The offshore big-wave reefs of Les Etocs can provide perfect 3-6m waves for daredevils only. Pors Carn is usually much quieter than La Torche, unless the swell is pumping, when more locals will be looking for the rare perfect days on the reef or in the protected southern corner.",
                    seabed: "Unever reef and sand", best_tide: "All",
                    difficulty_level: 1.0,
                    msw_id: 1533 )
spot_2.remote_photo_url = url
spot_2.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/La_Torche.jpg"
spot_3 = Spot.new(name: 'La Torche', address: "La Torche, Plomeur",
                    description: "Seminal Brittany surfspot with ultra-consistent, walled-up peak breaking beside rocky headland. Shorter but hollower rights break into the rip known as the elevator which flows straight to the peak. Lefts speed down the beach, but paddle back can be gruelling, so think about walking around to the rip. Many more breaks further north along beach at Tronoën or Penhors and mellow rights at the La Torche point at the end of Audierne Bay.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 3.0,
                    msw_id: 72 )
spot_3.remote_photo_url = url
spot_3.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/Gwendrez.jpg"
spot_4 = Spot.new(name: 'Gwendrez', address: "Gwendrez, Plouhinec",
                    description: "This Plouhinec beach became famous after pics of bodyboarders charging heavy 10ft barrels appeared in the press, despite it being a close-out most of the time. The low to mid tide outer sandbars can hold some fine shapely peaks, with fast walled up sections and tube potential, plus there's a rare but feisty left off the rocks at the southern end. Currents and rips get mean with size so it's no place for average surfers when it is overhead.",
                    seabed: "Unever reef and sand", best_tide: "Low Mid",
                    difficulty_level: 1.0,
                    msw_id: 1530 )
spot_4.remote_photo_url = url
spot_4.save!


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283961/Pointe_de_lervily.jpg"
spot_5 = Spot.new(name: 'Pointe de Lervily', address: "Pointe de Lervily, Esquibien",
                    description: "Two rights break over shallow reef; one close to the Island of Cows and another in the bay. Needs W or SW swell at decent size to break at Ile Aux Vaches and it will handle some size. Not really a barrel but fast and ledgey, requiring speed and skill to negotiate.",
                    seabed: "Unever reef", best_tide: "Mid High",
                    difficulty_level: 4.0,
                    msw_id: 1576 )
spot_5.remote_photo_url = url
spot_5.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283961/Saint_Tugen.jpg"
spot_6 = Spot.new(name: 'Saint Tugen', address: "anse du cabestan, saint tugen",
                    description: "The best beachbreak around in overhead conditions, delivering stand-up barrels at low tide. Faces straight into the SW swells, so any N wind will do and handles more size from more directions than most spots. At high tide, there can be a thumping bodyboarding shorey, but the rocks become a problem.",
                    seabed: "Sand", best_tide: "Low Mid",
                    difficulty_level: 3.5,
                    msw_id: 1575 )
spot_6.remote_photo_url = url
spot_6.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283958/Baie_des_trepasses.jpg"
spot_7 = Spot.new(name: 'Baie des Trépassés', address: "Baie des Trepasses, Cléden-Cap-Sizun",
                    description: "A good beachbreak with long rides when the conditions are ideal: low tide and a small W swell. This impressive cove picks up any swell going, churning out some long walls and also occasionally some hefty barrels off the high tide rock at the north end. There will be a crowd on small swell weekends, but there are plenty of easy waves stretched across the bay for all abilities.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 3.0,
                    msw_id: 73 )
spot_7.remote_photo_url = url
spot_7.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283967/Pors_theolen.jpg"
spot_8 = Spot.new(name: 'Porz Théolen', address: "Pors Théolen, Cléden-Cap-Sizun",
                    description: "The north coast of Cap Sizun conceals many little-known reefs and beaches. Check the sunken boat of Porz Théolen, Pors Péron or Pointe du Millier, before searching the bays for more secret spots.",
                    seabed: "Unever reef and sand", best_tide: "All",
                    difficulty_level: 3.0,
                    msw_id: 1574 )
spot_8.remote_photo_url = url
spot_8.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/Pointe_leyde.jpg"
spot_9 = Spot.new(name: 'Les Roches Blanches (Pointe Leydé)', address: "Les roches blanches, douarnenez",
                    description: "A very good left a.k.a. Roches Blanches, with a rocky take-off, followed by a long spinning wall. It needs a big swell and can get perfect in a SW storm. Handles W winds.",
                    seabed: "Unever reef", best_tide: "Low Mid",
                    difficulty_level: 4.0,
                    msw_id: 1171 )
spot_9.remote_photo_url = url
spot_9.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283961/Pors_ar_vag.jpg"
spot_10 = Spot.new(name: 'Pors-Ar-Vag', address: "chemin des dunes, Saint-Nic",
                    description: "A good beachbreak for beginners isolated in Lestrevet. Le Ris is another sheltered spot, just as sloppy but protected from stormy SW winds by high cliffs.",
                    seabed: "Sand", best_tide: "Mid High",
                    difficulty_level: 1.0,
                    msw_id: 1522 )
spot_10.remote_photo_url = url
spot_10.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283959/cap_de_la_chevre.jpg"
spot_11 = Spot.new(name: 'Cap de la chèvre', address: "cap de la chevre, crozon",
                    description: "Break out the guns and a long leg rope when a big W swell hits the headland.",
                    seabed: "Unever reef", best_tide: "Low Mid",
                    difficulty_level: 5.0,
                    msw_id: 1523 )
spot_11.remote_photo_url = url
spot_11.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/la_palue.jpg"
spot_12 = Spot.new(name: 'La Palue', address: "Plage De La Palue, Crozon",
                    description: "Wide open, west-facing beachbreak that picks up all available swells. Usually messy and weaker at low tide before lining up on the push past mid. Long walls and the odd barrel section make it a fun intermediate spot.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 3.7,
                    msw_id: 1524 )
spot_12.remote_photo_url = url
spot_12.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/kerloch.jpg"
spot_13 = Spot.new(name: 'Kerloch', address: "Plage de Kerloc'h, Crozon",
                    description: "Large winter swells light up this mellow beachbreak, which remains surfable with W winds if you stick in the north corner. Long rides with cutback walls and a high tide backwash. Further round the long scalloped beach is Kersiguennou, a good summer spot for beginners in front of the cliffs, while the south end is Goulien where it will be bigger in W-NW swells.",
                    seabed: "Sand", best_tide: "Mid High",
                    difficulty_level: 1.5,
                    msw_id: 1586 )
spot_13.remote_photo_url = url
spot_13.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283968/Anse_de_Pen_Hat.jpg"
spot_14 = Spot.new(name: 'Anse de Pen Hat', address: "Anse de Pen Hat",
                    description: "A hollow beachbreak that receives less swell than La Palue, despite good westerly exposure. Peaks at both ends are shaped by strong rips and the waves will have some punch at the favoured tide of mid incoming.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 2.3,
                    msw_id: 1521 )
spot_14.remote_photo_url = url
spot_14.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551283960/le_petit_minou.jpg"
spot_15 = Spot.new(name: 'Le petit Minou', address: "Pointe du Petit Minou, Plouzané",
                    description: "A hollow beachbreak with more rocks on the southern part known as ‘Les Moules’. Fun, curvy walls and smackable lips appear on any S-NW swell with any N wind offshore. Low tide only spot just helps to concentrate the extreme weekend crowds, due to Brest’s proximity.",
                    seabed: "Unever reef and sand", best_tide: "Low Mid",
                    difficulty_level: 3.0,
                    msw_id:  1520 )
spot_15.remote_photo_url = url
spot_15.save!

puts "#{Spot.count} spots created"

puts 'Finished!'
