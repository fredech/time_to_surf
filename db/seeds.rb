# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Spot.destroy_all

puts "create Users ..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551203149/Georgette.png"
georgette = User.new(pseudo: "Georgette", email: "georgette@gmail.com", password:"topsecret", password_confirmation:"topsecret")
georgette.remote_photo_url = url
georgette.save!

puts "#{User.count} users created"


puts "create Spots..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285012/Moliets.jpg"
spot_16 = Spot.new(name: 'MOLIETS PLAGE', address: "10 Rue de la Balise, Moliets",
                    description: "The central beach soaks up the summer crowd on very shifty sandbanks that often shut down. High tide is usually no good. The Huchet River mouth from Leon Lake can shape some nice lower tide sandbars.
                    All facilities with surfschools for the summer beach party hordes. The huge campsite also caters for bus loads of tourists from northern climes, coming to surf with various surf camps, creating tension in the water with the locals. Avoid the crowded peaks.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 2.3,
                    msw_id: 887 )
spot_16.remote_photo_url = url
spot_16.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285358/MESSANGES.jpg"
spot_17 = Spot.new(name: 'MESSANGES', address: "Plage de Messanges, Messanges",
                    description: "French beachbreak, with two main peaks one, left hander, slighty south, and a left and right peak, just slighty north, both work from mid to high on a NW swell, holds up to max 1.5 meters and barrels hard.",
                    seabed: "Sand", best_tide: "Mid High",
                    difficulty_level: 2,
                    msw_id: 3669 )
spot_17.remote_photo_url = url
spot_17.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285435/VIEUX_BOUCAU.jpg"
spot_18 = Spot.new(name: 'VIEUX BOUCAU', address: "Plage de Vieux Boucau, Vieux Boucau",
                    description: "The D652 gets closer to the coast here, allowing easy checking of several peaks. There are waves on both entrances to the lake. North side has fast, hollow peaks on higher tides, but heavy longshore rips at headhigh plus. Port d’Albret on the south side leads into the Soustons stretch and has good shape for kilometers. Handles more size than the breaks to the north.
                    Locals get twitchy in August as the campsites and holiday apartments fill up, leaving often crowded conditions. Surf schools, shops and rentals available. Watch the rips around the rivermouth.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 3,
                    msw_id: 64 )
spot_18.remote_photo_url = url
spot_18.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285262/CASERNES.jpg"
spot_19 = Spot.new(name: 'LES CASERNES', address: "Plage des Casernes, Seignosse",
                    description: "Classic Landes beachbreak, all tides depending on the sand",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 1,
                    msw_id: 1175 )
spot_19.remote_photo_url = url
spot_19.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285488/LE_PENON.jpg"
spot_20 = Spot.new(name: 'LE PENON', address: "Plage du Penon, Seignosse",
                    description: "Worthwhile sandbars can appear along this stretch that used to have a long metal pier that caught the sand. Open and shifty, it often holds some really good higher tide shore breaks that entertain the mix of locals and travellers avoiding the bigger name breaks to the south. Unmanageable rips and impossible paddle-outs at double overhead. More banks up towards Casernes.
                    Attracts huge summer crowds to the water park, fairground rides and tourist shops situated between the dunes and massive free carpark. Beware car crime at the north end (L’agréou), and strong rips. There’s a mini skatepark, but serious skaters should head to Hall04. All facilities including good surf school and webcam.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 3,
                    msw_id:  1529)
spot_20.remote_photo_url = url
spot_20.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285526/LES_BOURDAINE.jpg"
spot_21 = Spot.new(name: 'LES BOURDAINES', address: "Plage des Bourdaines, Seignosse",
                    description: "Good banks regularly form either side of the access path at what is probably the most popular and consistent spot in Seignosse. Stable sandbanks have forged this reputation over the years and there always seems to be a left/right just south of the path and multiple peaks up towards Penon. Often has a very defined channel between peaks and rippy inside sections. Dead high tide will be a struggle when small and diagonal super rips can hold up the close-outs when the faces exceed 8ft.
                    Bourdaines is a regular contest site because there is almost always something contestable and it is one of the shorter distance walks from car park to sand north of Hossegor. Holiday apartments make it more difficult to park here in summer when the place rams out by early afternoon. Cream Cafe in the northern conner is a local and surf industry hang out. All facilities, abilities and communities.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 5,
                    msw_id: 1532 )
spot_21.remote_photo_url = url
spot_21.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285571/LES_ESTAGNOTS.jpg"
spot_22 = Spot.new(name: 'LES ESTAGNOTS', address: "Place des Estagnots, Seignosse",
                    description: "Top quality peaks when a good W-NW swell hits the sand. Handles a bit more size than Bourdaines and Penon, but expect severe long-shore drift when bigger. High tide inside banks can be hollow and fast.
                    Always a crowd and the odd combative local. Large car park used to be free-camp central, but it is now forbidden to park campervans in any Seignosse car park overnight. The fine is €11, which may work out cheaper than the Aire de Camping back on the D79 or any of the big campsites within 10mins walk of here. Restaurants, bars, shops and a well-stocked surf shop add to the usual set up.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 4,
                    msw_id: 890 )
spot_22.remote_photo_url = url
spot_22.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285609/LES_CULS_NUS.jpg"
spot_23 = Spot.new(name: 'LES CULS NUS', address: "132 Avenue des Tamaris, Soorts-Hossegor",
                    description: "The link between the normal beachbreaks to the north and the heavy shories of La Graviere. Usually better at mid to high tides with a moderate swell, because of the steeper beach angle. Powerful action close to shore.
                    Spends small summer swells dormant so only scores a 6 for consistency and about the same for crowds. The limited roadside parking (beware soft sand), long, slatted, dune stabilising paths and lack of facilities deter the lazy. Location for the Quik Pro in 2010 and delivered astonishing barrels in tow out conditions. Cul Nul translates as bare bums giving the summer sea lice a bigger target.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 5,
                    msw_id: 889 )
spot_23.remote_photo_url = url
spot_23.save!


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285650/LA_GRAVIERE.jpg"
spot_24 = Spot.new(name: 'LA GRAVIERE', address: "La Gravière, Hossegor",
                    description: "Sited on an old gravel pit, this is the legendary Hossegor tube spot. Dredging the rivermouth has affected wave quality in the past, but it is back with a vengeance, hosting pro-surfing competitions in huge conditions, including the 2011 Quik Pro. Sometimes white-caps outside, rolls in and reforms, standing up over the shallow inside bars. Heavy, thick-lipped beasts, break perilously close to shore and often close-out, snapping more boards than just about anywhere. Tidal range radically affects the window for ideal conditions, as does swell period, which decides if it is messy and inconsistent or lined-up and bombing through. The rip speed usually rises in direct proportion with the swell height and on big days, only the tow crew will be able to get into the sets before being swept south in the current.
Humbling for all, but the barrel experts and the pros. Facilities down the beach at Hossegor's Front de Mer. Park along Blvd de Front de Mer (D79) and use slatted access paths through the stabilised dunes.
Park along Blvd De Front de Mer (D79) and use access paths or park at La Nord and walk up the beach.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 4.7,
                    msw_id: 1175 )
spot_24.remote_photo_url = url
spot_24.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285725/LA_NORD.jpg"
spot_25 = Spot.new(name: 'LA NORD', address: "Plage Centrale, Hossegor",
                    description: "Usually the only rideable beachbreak north of Capbreton when the swell heads towards 3m on the Biscay buoy. The shifting, outside bank holds triple overhead plus and favours rights into the rip torn paddling channel. Steep drops and fast walls with barrel sections mean extra inches are a good idea. Can work at all tides but mid is the best bet. Going left often leads to a punishing paddle back out as the deeper, defined paddling channel is usually south of the waves towards Centrale.
Heavy water when the rips are in full flow, as a torrent of water makes its way down from the Seignosse beach whitewater maelstrom to the north. Once the vicious shoredump is negotiated there can be a deep trough, allowing the unskilled to easily get out of their depth. La Nord is always crowded, even when smaller and when the big swells hit, everyone descends on the area, often only to watch. Popular with the local SUP crew on smaller days and extra inches are a good idea to get into the jacking sets. Height restriction on the car park so vans have to use the ever-shrinking street parking.
Park along Blvd De La Grand Dune - La Nord is 400m north from Front de Mer",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 4.3,
                    msw_id: 891 )
spot_25.remote_photo_url = url
spot_25.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285768/LA_SUD.jpg"
spot_26 = Spot.new(name: 'LA SUD', address: "500 Boulevard de la Dune, Soorts-Hossegor",
                    description: "A sheltered spot for those not willing to tackle la Nord on big days. Favours lefts and gives beginner/improvers somewhere to surf away from the rippers. Easy and never too big but turns into an unsurfable shorebreak on high tide.
                    Water quality is dubious,  being so close to the rivermouth. Park on Blvd De La Grand Dune south of the Front de Mer roundabout.",
                    seabed: "Sand", best_tide: "Low Mid",
                    difficulty_level: 3.3,
                    msw_id: 1531 )
spot_26.remote_photo_url = url
spot_26.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285768/LA_SUD.jpg"
spot_27 = Spot.new(name: "L'ESTACADE", address: "Plage Centrale, Capbreton",
                    description: "Tucked along the port’s south jetty, this is the ultimate shelter with laughable size compared to exposed beaches. Handles some N wind. Sometimes full and bloated, occasionally sucky and closing-out, but never perfect.
Many beginners and desperadoes when it’s the only option. High tide backwash off the seawalls that protect the shops and restaurants on this crowded tourist strip. Centre of town pay car park or in the smaller lots and streets a block behind the shops.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 2,
                    msw_id: 1175 )
spot_27.remote_photo_url = url
spot_27.save


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285890/LE_PREVENT.jpg"
spot_28 = Spot.new(name: 'LE PREVENT', address: "Plage du Prévent, Capbreton",
                    description: "Stuck between two groynes and the athletes physiotherapy centre is a tiny beach with hollow bowls on a strong swell. This is where most of the surfers in the area will end up in winter and fight for one of the steep, sucky, sand-churning slammers that might just hold up enough for a short, fast ride. There's often a left into the rips near the southern groyne and a stable right at the north end.
  Plenty of close-outs and terrible backwash on high tide. Over-populated on weekends  attracting plenty of bodyboarders. Surf schools seem to use this beach when really it is for intermediates upwards. More difficult town parking since they pedestrianised the beachfront.",
                    seabed: "Sand", best_tide: "Low Mid",
                    difficulty_level: 1,
                    msw_id: 1527 )
spot_28.remote_photo_url = url
spot_28.save!


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551285940/LE_SANTOCHA.jpg"
spot_29 = Spot.new(name: 'LE SANTOCHA', address: "Plage de la Savane, Capbreton",
                    description: "The most regularly surfed wave in Capbreton, complete with 30yr old surf club. Picks up swells that close-out the open beaches and forms up nice, fat peaks. Good drops followed by slopey walls and close-out inside section. A righthander tends to form along the groyne and it gets much hollower the further south you drift towards the blockhaus. Rips are often strong and paddle-outs can be long - many choose to sneak out at Le Prevent and paddle around the groyne.
                    Plenty of beginners from the Capbreton surf schools on smaller days and plenty of rippers. Regular contest site from local to King of the Groms. Consistent and crowded year-round with little parking on Impasse de la Savanne. The local boulangerie/patisserie is famed for post surf pastries.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 4,
                    msw_id: 1526 )
spot_29.remote_photo_url = url
spot_29.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551287541/VVF.jpg"
spot_30 = Spot.new(name: 'LA PISTE/VVF', address: "Plage de la Piste, Capbreton",
                    description: "With semi-submerged blockhaus scattered in the sand and a large dune system keeping the suburbs in check, this is one of the most photographed beaches on the coast. Perfect barrels are regularly on offer for those that can handle the packs of gifted locals and tube-hungry visitors. From low to mid tide is prime time, when the swell focuses on banks that seem to have a bit more punch and urgency than just about anywhere in Hossegor, so prepare for air drops and some solid floggings when it reaches headhigh plus. There will be more sand-dredging peaks up towards the massive VVF camping village, where more space is not necessarily guaranteed. Needs more swell energy than the open beaches to the north and hates the onshore wind, but when it is on, it's top quality.
High consistency in the 7-8 range, means it is always crowded with shortboarders and bodyboarders, hucking and tucking in the shorey. There are some strong currents, but without the rips, it would be more of a straight-hander. It has been known to get tense around here so only confident intermediates should try their luck.",
                    seabed: "Sand", best_tide: "All",
                    difficulty_level: 4,
                    msw_id: 883 )
spot_30.remote_photo_url = url
spot_30.save





puts "#{Spot.count} spots created"






puts 'Finished!'





