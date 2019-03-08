
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy datas..."
Profile.destroy_all
PreferredSpot.destroy_all
Review.destroy_all
SurfSession.destroy_all
User.destroy_all
Spot.destroy_all
puts "Datas destroyed!"

puts "create Users..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551203149/Georgette.png"
georgette = User.new(pseudo: "Georgette", email: "georgette@gmail.com", password:"topsecret", password_confirmation:"topsecret")
georgette.remote_photo_url = url
profile = Profile.new(level: "Intermediate", address: "16 villa gaudelet, Paris")
profile.user = georgette
georgette.save!
profile.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551945578/alice.png"
alice = User.new(pseudo: "Alice", email: "alice@gmail.com", password:"topsecret", password_confirmation:"topsecret")
alice.remote_photo_url = url
profile = Profile.new(level: "Advanced", address: "10 villa gaudelet, Paris")
profile.user = alice
alice.save!
profile.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551945578/antoine.jpg"
antoine = User.new(pseudo: "Antoine", email: "antoine@gmail.com", password:"topsecret", password_confirmation:"topsecret")
antoine.remote_photo_url = url
profile = Profile.new(level: "Intermediate", address: "1, rue de l'Yser, Treffiagat")
profile.user = antoine
antoine.save!
profile.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551945577/fred.jpg"
fred = User.new(pseudo: "Frederic", email: "frederic@gmail.com", password:"topsecret", password_confirmation:"topsecret")
fred.remote_photo_url = url
profile = Profile.new(level: "Intermediate", address: "544 avenue du golf, Hossegor")
profile.user = fred
fred.save!
profile.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551945577/damien.jpg"
damien = User.new(pseudo: "Damien", email: "damien@gmail.com", password:"topsecret", password_confirmation:"topsecret")
damien.remote_photo_url = url
profile = Profile.new(level: "Beginner", address: "12 villa gaudelet, Paris")
profile.user = damien
damien.save!
profile.save!

puts "#{User.count} user with #{Profile.count} profile created"

puts "create Spots..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551275874/Lesconil.jpg"
spot_1 = Spot.new(name: 'Lesconil', address: "Anse de Lesconil, Lesconil",
                    description: "This stretch of coast, including nearby Benodet and Beg Meil, requires a rare combination of S swell and N winds to provide anything else than windsurf conditions. When on, a reef close to the harbour offers hollow, powerful, low tide lefts and some lesser rights.",
                    seabed: "Unever reef and sand", best_tide: "Low Mid",
                    difficulty_level: 4.5,
                    msw_id: 1534 )
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
spot_30.save!


puts "#{Spot.count} spots created"


users = [antoine, alice, damien, georgette]



puts "create Surf sessions..."

surf_session_1 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_3 )
surf_session_1.save!

surf_session_2 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_3)
surf_session_2.save!

surf_session_3 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_3 )
surf_session_3.save!

surf_session_4 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_17 )
surf_session_4.save!

surf_session_5 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_17 )
surf_session_5.save!

surf_session_6 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_17 )
surf_session_6.save!

surf_session_7 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_19 )
surf_session_7.save!



surf_session_8 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: spot_19 )
surf_session_8.save!

surf_session_9 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_9.save!

surf_session_10 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_10.save!

surf_session_11 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_11.save!

surf_session_12 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_12.save!

surf_session_13 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_13.save!

surf_session_14 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_14.save!

surf_session_15 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_15.save!

surf_session_16 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_16.save!

surf_session_17 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_17.save!

surf_session_18 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_18.save!

surf_session_19 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_19.save!

surf_session_20 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_20.save!

surf_session_21 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_21.save!

surf_session_22 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_22.save!

surf_session_23 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_23.save!

surf_session_24 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_24.save!

surf_session_25 = SurfSession.new( start_time: "2019-03-01 12:00",
                                  user: users.sample,
                                  spot: Spot.all.sample )
surf_session_25.save!

puts "#{SurfSession.count} Surf sessions created"


puts "create reviews..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954010/Reviews/pointe-de-la-torche-baie-d-audier-5-1200x675.jpg"
review_1 = Review.new(  content: "Beautiful beach, we had a great session",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: surf_session_5)
review_1.remote_photo_url = url
review_1.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954010/Reviews/photo-1446847404680-94b43ddf5d59.jpg"
review_2 = Review.new(  content: "Beach was good for beginners",
                        facilities: '3',
                        access: '4',
                        condition: '5',
                        surf_session: surf_session_4)
review_2.remote_photo_url = url
review_2.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954010/Reviews/plage-du-goudoul-a-lesconil.jpg"
review_3 = Review.new(  content: "Quite a long walk to get to the beach, but once we were there the waves were good",
                        facilities: '3',
                        access: '2',
                        condition: '4',
                        surf_session: surf_session_6)
review_3.remote_photo_url = url
review_3.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954010/Reviews/les-rochers-de-lesconil-2.jpg"
review_4 = Review.new(  content: "Great waves, but beach full of rocks",
                        facilities: '3',
                        access: '3',
                        condition: '3',
                        surf_session: surf_session_1)
review_4.remote_photo_url = url
review_4.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954009/Reviews/ob_e13891_les-estagnots.jpg"
review_5 = Review.new(  content: "Sandy beach with great coffee shop. Waves could have been bigger",
                        facilities: '5',
                        access: '5',
                        condition: '4',
                        surf_session: surf_session_2)
review_5.remote_photo_url = url
review_5.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954009/Reviews/Hossegor.jpg"
review_6 = Review.new(  content: "Beatiful beach but very touristy. Waves not great",
                        facilities: '3',
                        access: '5',
                        condition: '2',
                        surf_session: surf_session_3)
review_6.remote_photo_url = url
review_6.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954009/Reviews/La-Torche-Surf-Spot-for-beginners-in-Brittany-France.jpg"
review_7 = Review.new(  content: "Great session. Thanks TTS",
                        facilities: '4',
                        access: '4',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_7.remote_photo_url = url
review_7.save!


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954008/Reviews/hossegor_1.jpg"
review_8 = Review.new(  content: "Weather conditions not great but waves were good",
                        facilities: '3',
                        access: '3',
                        condition: '4',
                        surf_session: SurfSession.all.sample )
review_8.remote_photo_url = url
review_8.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954008/Reviews/ea.jpg"
review_9 = Review.new(  content: "Beautiful beach, but no waves the whole time we were there!",
                        facilities: '4',
                        access: '4',
                        condition: '1',
                        surf_session: SurfSession.all.sample )
review_9.remote_photo_url = url
review_9.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954008/Reviews/DigueexternVague_5194-b.jpg"
review_10 = Review.new(  content: "Not a beach for beginners!",
                        facilities: '4',
                        access: '4',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_10.remote_photo_url = url
review_10.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954008/Reviews/DigueexternVague_5194-b.jpg"
review_11 = Review.new(  content: "This photo was taken early, the waves came later. Everything was perfect!",
                        facilities: '4',
                        access: '4',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_11.remote_photo_url = url
review_11.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/dfd90de12695695295b98f8c583c9229.jpg"
review_12 = Review.new(  content: "Great session. Thanks TTS",
                        facilities: '4',
                        access: '4',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_12.remote_photo_url = url
review_12.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954008/Reviews/carnet-adresses-week-end-landais-entre-capbreton-hossegor_exact1900x908_l.jpg"
review_13 = Review.new(  content: "Got a good suntan but no waves :(",
                        facilities: '5',
                        access: '4',
                        condition: '2',
                        surf_session: SurfSession.all.sample )
review_13.remote_photo_url = url
review_13.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/dfd90de12695695295b98f8c583c9229.jpg"
review_14 = Review.new(  content: "Fantastic session. We'll be back!",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_14.remote_photo_url = url
review_14.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/9097_373808_6.jpg"
review_15 = Review.new(  content: "Took this photo in the morning before the waves came. Watch out for the swimmers but otherwise I recommend this beach to all surf levels",
                        facilities:'2',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_15.remote_photo_url = url
review_15.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/20110206145236-20640_large.1493561221.jpg"
review_16 = Review.new(  content: "Conditions quite difficult for beginners but beach is great",
                        facilities: '5',
                        access: '5',
                        condition: '3',
                        surf_session: SurfSession.all.sample )
review_16.remote_photo_url = url
review_16.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/01_Pointe_de_la_Torch.jpg"
review_17 = Review.new(  content: "Great session",
                        facilities: '4',
                        access: '4',
                        condition: '5',
                        surf_session: SurfSession.all.sample )
review_17.remote_photo_url = url
review_17.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954007/Reviews/2017-03-13-1440x960-france-biarritz-hotel-marbella-s53oimdlc-jpg.jpg"
review_18 = Review.new(  content: "Not for beginners! Feared for my life a few times but still had a great time",
                        facilities: '5',
                        access: '5',
                        condition: '4',
                        surf_session: SurfSession.all.sample )
review_18.remote_photo_url = url
review_18.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551954006/Reviews/88529808.jpg"
review_19 = Review.new(  content: "Great beach!",
                        facilities: '5',
                        access: '5',
                        condition: '3',
                        surf_session: SurfSession.all.sample)
review_19.remote_photo_url = url
review_19.save!


url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/resizedshutterstock_446243254_trestraou_beach_of_perros-guirec_in_brittany_france.jpg"
review_20 = Review.new(  content: "Perfect beach for kids to learn to surf",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_20.remote_photo_url = url
review_20.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/La-Torche-Surf-Spot-for-beginners-in-Brittany-France.jpg"
review_21 = Review.new(  content: "Very narrow drive down to the beach but once we were there the conditions were perfect",
                        facilities: '3',
                        access: '2',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_21.remote_photo_url = url
review_21.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/surfing-in-biarritz-768x576.jpg"
review_22 = Review.new(  content: "We were all beginners and had a great time",
                        facilities: '4',
                        access: '4',
                        condition: '3',
                        surf_session: SurfSession.all.sample)
review_22.remote_photo_url = url
review_22.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/surfing-la-mauvaise-gre%CC%80ve-brittany.jpg"
review_23 = Review.new(  content: "Great surf session",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_23.remote_photo_url = url
review_23.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/0-presqu-ile-de-quiberon-surf-yannick-le-gal-1920x1278.jpg"
review_24 = Review.new(  content: "15 min walk down the beach, quite annoying when you're carrying a board, but otherwise nice conditions",
                        facilities: '3',
                        access: '2',
                        condition: '4',
                        surf_session: SurfSession.all.sample)
review_24.remote_photo_url = url
review_24.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/Isla_Margarita_and_Sucre.jpg"
review_25 = Review.new(  content: "Thanks for the recommendation, exactly what I was looking for",
                        facilities: '5',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_25.remote_photo_url = url
review_25.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958739/Reviews/New%20Photos/beach_lostmarch_la_palue.jpg"
review_26 = Review.new(  content: "Great beach!",
                        facilities: '5',
                        access: '5',
                        condition: '3',
                        surf_session: SurfSession.all.sample)
review_26.remote_photo_url = url
review_26.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958739/Reviews/New%20Photos/image.jpg"
review_27 = Review.new(  content: "Great beach for beginners!",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_27.remote_photo_url = url
review_27.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/Isla_Margarita_and_Sucre.jpg"
review_28 = Review.new(  content: "Great beach!",
                        facilities: '3',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_28.remote_photo_url = url
review_28.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551958740/Reviews/New%20Photos/La-Torche-Surf-Spot-for-beginners-in-Brittany-France.jpg"
review_29 = Review.new(  content: "Thanks for the recommendation!",
                        facilities: '4',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_29.remote_photo_url = url
review_29.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/surfing-cote-des-basques-biarritz_1.jpg"
review_30 = Review.new(  content: "Amazing waves",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_30.remote_photo_url = url
review_30.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/la-vague-basque-instruction.jpg"
review_31 = Review.new(  content: "We had a great time",
                        facilities: '4',
                        access: '4',
                        condition: '4',
                        surf_session: SurfSession.all.sample)
review_31.remote_photo_url = url
review_31.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/97ff5b5c23c82287559552b36b16e270_L.jpg"
review_32 = Review.new(  content: "Great recommendation, conditions were perfect. No where to get anything to eat on the beach",
                        facilities: '2',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_32.remote_photo_url = url
review_32.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/surfing-cote-des-basques-biarritz.jpg"
review_33 = Review.new(  content: "Thanks for the recommendation!",
                        facilities: '4',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_33.remote_photo_url = url
review_33.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/destination-biarritz-3-b.jpg"
review_34 = Review.new(  content: "Waves quite small but otherwise good session",
                        facilities: '3',
                        access: '5',
                        condition: '4',
                        surf_session: SurfSession.all.sample)
review_34.remote_photo_url = url
review_34.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/500-grandeplage-france.jpg"
review_35 = Review.new(  content: "Thanks TTS, perfect recommendation!",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_35.remote_photo_url = url
review_35.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/destination-biarritz-3-b_1.jpg"
review_36 = Review.new(  content: "Thanks for the recommendation!",
                        facilities: '4',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_36.remote_photo_url = url
review_36.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/camping-biarritz-pays-basque.jpg"
review_37 = Review.new(  content: "Great session",
                        facilities: '4',
                        access: '3',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_37.remote_photo_url = url
review_37.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964717/Reviews/New%20Photos/Final%20photos/article_Biarritz-Pays-Basque_1120x490.jpg"
review_38 = Review.new(  content: "Quite a lot of rocks on the beach but waves nice",
                        facilities: '4',
                        access: '3',
                        condition: '4',
                        surf_session: SurfSession.all.sample)
review_38.remote_photo_url = url
review_38.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1551964716/Reviews/New%20Photos/Final%20photos/biarritz-01-hi.jpg"
review_39 = Review.new(  content: "Perfect surf session",
                        facilities: '5',
                        access: '5',
                        condition: '5',
                        surf_session: SurfSession.all.sample)
review_39.remote_photo_url = url
review_39.save!

puts "#{Review.count} reviews created"

puts "Updating spots weather conditions..."
Spot.find_in_batches(batch_size: 500).each do |spots|
  spots.each do |spot|
    FetchWeatherConditionsService.new(spot).call
  end
end

puts 'Finished!'
