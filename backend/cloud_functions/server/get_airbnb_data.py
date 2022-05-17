import logging
from flask import abort, Response, jsonify

country_bnb_json = {
        "Australia" : [
            {
                "guests" : 3,
                "bedroom" : 1,
                "beds" : 2,
                "baths" : 1,
                "title" : "Ravenswood Tiny House",
                "caption" : "Tiny home hosted by Michelle",
                "image_url" : [
                    "https://a0.muscache.com/im/pictures/0fe76007-93a4-405d-a155-cb29adf5ed2d.jpg",
                    "https://a0.muscache.com/im/pictures/6e92ce12-d06c-482e-980f-510d84be2966.jpg"
                ],
                "description" : '''
                    Located in beautiful Ravenswood, this compact yet contemporary and comfortable tiny house is perfect for those wanting to get away from the hustle and bustle of every day life.
                    We are located just 8 minutes from the world-class La Larr Ba Gauwa mountain bike park in Harcourt, 20 minutes from Bendigo and 15 minutes from Castlemaine.
                    We are in close proximity to local wineries including BlackJack Wines and Killiecrankie Wines and and we are surrounded by beautiful bushland & rolling hills.
                '''
            },
            {
                "guests" : 2,
                "bedroom" : 1,
                "beds" : 1,
                "baths" : 1,
                "title" : "Gawthorne's Hut - BEST UNIQUE STAY - Airbnb 2021",
                "caption" : "Hut hosted by Rick And Steph",
                "image_url" : [
                    "https://a0.muscache.com/im/pictures/miso/Hosting-45646568/original/6d82b90d-4cab-463e-8987-ee128c519ed9.jpeg",
                    "https://a0.muscache.com/im/pictures/3f678cb4-b7cd-4039-8aa9-80c868e743f9.jpg"
                ],
                "description" : '''
                    Gawthorne's Hut is a luxurious, architect designed, off grid Eco hut just for couples. 
                    It is the newest of Wilgowrah's unique country escapes. Built to capture stunning views it provides guests with peace, privacy and a sense of isolation. 
                    Inclusions - King bed, full bath, shower, flushing toilet and kitchenette. Gawthorne's Hut now has day time air conditioning. 
                    "Wilgowrah" is a historic and picturesque rural property well known for its first escape - Tom's Cottage
                '''
            },
            {
                "guests" : 2,
                "bedroom" : 1,
                "beds" : 1,
                "baths" : 1,
                "title" : "Hideout Cabin - Luxury Tiny Home",
                "caption" : "Tiny home hosted by Thomas",
                "image_url" : [
                    "https://a0.muscache.com/im/pictures/f923b294-8b45-4a18-be06-485ee401b400.jpg",
                    "https://a0.muscache.com/im/pictures/495adc30-7edb-4248-91f5-96350f9db333.jpg"
                ],
                "description" : '''
                    The first of its kind in the Southern Highlands. Hideout is an exclusive luxury tiny home in an idyllic farm setting. 
                    This tiny home is set on a beautiful dam of a working horse farm, situated on over 150 acres.
                    Guests are able to interact as much or as little as they like with the surroundings.
                '''
            }
        ],
        "Croatia" : [
            {
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Lux Fjaka No1",
				"caption": "Entire rental unit hosted by Ivana",
				"image_url": [
					"https://a0.muscache.com/im/pictures/495ee380-6177-45ab-9481-bd707c8fa793.jpg",
					"https://a0.muscache.com/im/pictures/5e60136a-7daa-491a-b007-595653d28dff.jpg"
				],
				"description": '''
				Small newly renovated studio apartment with separate dormitory.In the center of Split and near Diocletian 's palace, city market,bus station,railway station and ferry port. In the immediate vicinity is Bacvice beach and many other cultural sights. In the vicinity there are various entertainment facilities and a rich offer for day and night parties.
				'''
			},
			{
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Brand New Lux Studio Teatar3 in the heart of Split",
				"caption": "Entire rental unit hosted by Ivana",
				"image_url": [
					"https://a0.muscache.com/im/pictures/miso/Hosting-50828026/original/a1b8172c-8b9d-4fda-8313-8b8329bb7810.jpeg",
					"https://a0.muscache.com/im/pictures/miso/Hosting-50828026/original/38f98851-5617-4420-8ad0-920fae2e6679.jpeg"
				],
				"description": 
                '''
				Brand new studio apartment in the heart of Split old town,
				located 5 minutes walk from the UNESCO - protected Diocletian 's Palace. 15 minutes walk from the popular Bačvice Beach. The Riva Promenade is a 5 minutes away.
				'''
			},
			{
				"guests": 4,
				"bedroom": 2,
				"beds": 3,
				"baths": 2,
				"title": "Perfectly located Cherry's apartment in Varos",
				"caption": "Entire rental unit hosted by Bruna",
				"image_url": [
					"https://a0.muscache.com/im/pictures/miso/Hosting-22461340/original/d5655e90-39e1-46f6-b9fc-6b1e60db99d9.jpeg?",
					"https://a0.muscache.com/im/pictures/ad87d866-3319-4ecd-9354-4f90a0246c11.jpg"
				],
				"description": '''
				This is new apartment in the Varos district,
				Split 's old part of the city. The apartment is a minute walk from the promenade, 10-15 min walk from the beach.This year we made additional bedroom and the bathroom in this apartment and now it has two bedrooms and two bathrooms with shower. It is located next to the one of the oldest small churches in Split, St. Nicholas. It doesn'
				t ring the bells so there is no any noise from the church in the mornings or during the day.
				'''
			}
		],
    "Brazil" : [
        {
				"guests": 8,
				"bedroom": 4,
				"beds": 5,
				"baths": 2.5,
				"title": "Exceptional property private beach - rare",
				"caption": "Entire home hosted by Anthony",
				"image_url": [
					"https://a0.muscache.com/im/pictures/miso/Hosting-156247/original/0c33ae98-32ab-48e1-b98d-453f3bf35299.jpeg",
					"https://a0.muscache.com/im/pictures/miso/Hosting-156247/original/e40c4d23-f438-44d4-ab6c-6d8196dcf91e.jpeg"
				],
				"description": '''
				It was designed in tropical timber by an architect from Porto Alegre, mixing glass and wood,
				with panoramic sea views, with modern bathrooms and a fully equipped kitchen. It is integrated into nature and has a warm atmosphere and a beautiful view.
				'''
			},
			{
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Tiny House Mandaguari",
				"caption": "Tiny home hosted by Raphael",
				"image_url": [
					"https://a0.muscache.com/im/pictures/01d9d9a5-925c-4e3d-9422-bdc9c0fea45a.jpg",
					"https://a0.muscache.com/im/pictures/0e5fdb6f-a06e-4e97-a34f-ee660e1806f8.jpg"
				],
				"description": '''
				Mini home made with an immersion in nature in comfort in a unique and exclusive space.
				The house is located 8 minutes from Indianapolis and 45 minutes from Uberlândia / Araguari.
				Located in an area of 110, 000 square meters with private entrance and in an entire private area.
				The site has other facilities(such as headquarters, entrance to Waterfall, bathrooms)
				'''
			},
			{
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Hut of Sossego",
				"caption": "Entire cabin hosted by Kellen",
				"image_url": [
					"https://a0.muscache.com/im/pictures/miso/Hosting-49840035/original/5899be8a-bb5e-4c1b-9c48-910b7d5a443f.jpeg",
					"https://a0.muscache.com/im/pictures/miso/Hosting-49840035/original/919e980d-e382-413e-8e82-f3e8410cae07.jpeg"
				],
				"description": '''
				The Cabana do Sossego was inspired by the American and Canadian Cabins.A wonderful encounter of nature with Architecture.
				Made entirely of rustic wood,
				but decorated with every luxury and design so that the guest has an unforgettable experience with refinement and warmth.
				A unique space of contact with nature,
				rest and tranquility.
				Enjoy the tranquility of our region to enjoy moments together,
				rest and have fun.
				'''
			}
		],
        "South Africa" : [{
				"guests": 2,
				"bedroom": 1,
				"beds": 2,
				"baths": 1.5,
				"title": "Chic Penthouse with Private Pool & Breathtaking Views",
				"caption": "Entire loft hosted by Gabriel",
				"image_url": [
					"https://a0.muscache.com/im/pictures/9ffc0181-5464-43b7-8884-23c8639085d9.jpg",
					"https://a0.muscache.com/im/pictures/d0ca15e5-87bc-4912-bbc0-6c564e42afc7.jpg"
				],
				"description": '''
				Sit back in a private plunge pool and enjoy an uninterrupted vista of Table Mountain,
				the city skyline,
				and the ocean beyond.The views are just as good from inside this chic and modern penthouse,
				where sunlight pours in through walls of windows.
				'''
			},
			{
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Couplespod at Riverstone House Portfolio",
				"caption": "Farm stay hosted by Candice",
				"image_url": [
					"https://a0.muscache.com/im/pictures/f7f79d47-7d08-4b2d-acaa-8117736b6c7b.jpg",
					"https://a0.muscache.com/im/pictures/56f019de-ac98-49f8-8322-546c43ea2502.jpg"
				],
				"description": '''
				In the unlikely event a Host needs to cancel your booking within 30 days of check - in ,
				we will find you a similar or better home,
				or we will refund you.
				If at any time during your stay you find your listing isn 't as advertised—for example, the refrigerator stops working and your Host can’t easily fix it, or it has fewer bedrooms than listed—you'
				ll have three days to report it and we will find you a similar or better home,
				or we will refund you.
				'''
			},
			{
				"guests": 4,
				"bedroom": 2,
				"beds": 3,
				"baths": 1,
				"title": "Tugela River Lodge: Kingfisher Cottage",
				"caption": "Tiny home hosted by Thomas",
				"image_url": [
					"https://a0.muscache.com/im/pictures/d3ef3788-58a1-4699-8155-8d802322f43e.jpg",
					"https://a0.muscache.com/im/pictures/f590c6dc-0104-46d3-9c4f-8a1389901688.jpg"
				],
				"description": '''
				Kingfisher Cottage is a cosy 4 sleeper and is our newest addition to Tugela River Lodge.The unit boasts amazing views of the river and Spioenkop Mountain...watch giraffe browsing in the game reserve from your kitchen window!This little cottage is perfect
				for a weekend getaway, week long stay or even just a one - nighter when passing through from JHB to Durban.
				'''
			}
		],
        "Canada" : [
            {
				"guests": 2,
				"bedroom": 1,
				"beds": 1,
				"baths": 1,
				"title": "Escape North to Muskoka A-Frame | 4-Season Chalet",
				"caption": "Entire cottage hosted by David",
				"image_url": [
					"https://a0.muscache.com/im/pictures/miso/Hosting-44274750/original/55ea1f7b-911e-46d9-b35c-aa288d8127dc.jpeg",
					"https://a0.muscache.com/im/pictures/miso/Hosting-44274750/original/99fa9105-3f97-46c6-aa2d-7cfaaf2b75b7.jpeg"
				],
				"description": '''
				This classic 70's A - frame has been re - imagined for the modern world.Wake up to swaying treetops,
				make gourmet meals & relax by the fire, in the forest - view great room.
				Hide away at the cottage or make it your base for endless excursions: 3 min to the private - access beach,
				skiing & snowboarding.World - class golf.Hike, canoe or ice skate at Arrowhead or Algonquin Parks & visit Huntsville
				for local charm, all just minutes away.
				'''
			},
			{
				"guests": 6,
				"bedroom": 3,
				"beds": 4,
				"baths": 2.5,
				"title": "Fitzroy Fieldhouse - Free Bikes, Near Wineries!",
				"caption": "Entire bungalow hosted by James",
				"image_url": [
					"https://a0.muscache.com/im/pictures/f60cf558-9aea-4118-8dde-e9d30e208149.jpg",
					"https://a0.muscache.com/im/pictures/5c05b8df-a617-4942-8092-9f19d41ba17e.jpg"
				],
				"description": '''
				Mid - century modern inspired home on a quiet street less than 2 km from PEC 's best and most popular wineries (Rosehall, Norm Hardie, Hinterland).
				Fully - licensed STA.Your stay qualifies for the $400 Ontario staycation tax credit! Outdoor campfire, satellite TV and Starlink high - speed internet, Tesla charger, games,
				air conditioning, bikes, mattress warmers and huge soaker tub '''
			},
			{
				"guests": 4,
				"bedroom": 2,
				"beds": 2,
				"baths": 1,
				"title": "Mountain Cabin in Heartland Acres",
				"caption": "Entire cabin hosted by Julie",
				"image_url": [
					"https://a0.muscache.com/im/pictures/f5a7002a-4700-4a93-91dd-52c3d5124bdc.jpg",
					"https://a0.muscache.com/im/pictures/32251d62-ee57-4703-a14c-1ac2d259c1c0.jpg"
				],
				"description": '''
				Enjoy this eco friendly two bedroom rustic mountain cabin with the view of Willowbank Mountain,
				equipped with all the necessities you need
				for great mountain vacation.
				Cabin is situated in a 20 acres homestead surrounded with mountains and lush forest.It 's a perfect place to unwind and relax after your mountain adventures.
				We are located 18 - 20 minutes drive west from the town of Golden in the quiet and beautiful Blaeberry Valley.
				'''
			}
		]
    }

def get_air_bnb_details(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    country = None
    if request.args and 'country' in request.args:
        country = request.args.get('country')
    
    if country == None:
        logging.error(RuntimeError('Country expected as argument'))
        return abort(Response('Country expected as argument'))

    if country in country_bnb_json:
        return jsonify(country_bnb_json[country])
    return abort(Response(f'No Details available for Country {country}'))