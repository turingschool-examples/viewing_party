require 'rails_helper'

RSpec.describe 'Movie Details(show) Page' do
  before :each do
    null = nil
    details = {
    "adult": false,
    "backdrop_path": "/gNBCvtYyGPbjPCT1k3MvJuNuXR6.jpg",
    "belongs_to_collection": null,
    "budget": 13200000,
    "genres": [
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10749,
            "name": "Romance"
        }
    ],
    "homepage": "",
    "id": 19404,
    "imdb_id": "tt0112870",
    "original_language": "hi",
    "original_title": "दिलवाले दुल्हनिया ले जायेंगे",
    "overview": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
    "popularity": 18.601,
    "poster_path": "/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
    "production_companies": [
        {
            "id": 1569,
            "logo_path": "/lvzN86o3jrP44DIvn4SMBLOl9PF.png",
            "name": "Yash Raj Films",
            "origin_country": "IN"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "IN",
            "name": "India"
        }
    ],
    "release_date": "1995-10-20",
    "revenue": 100000000,
    "runtime": 190,
    "spoken_languages": [
        {
            "english_name": "Hindi",
            "iso_639_1": "hi",
            "name": "हिन्दी"
        }
    ],
    "status": "Released",
    "tagline": "Come Fall In love, All Over Again..",
    "title": "Dilwale Dulhania Le Jayenge",
    "video": false,
    "vote_average": 8.7,
    "vote_count": 2860
}
    @movie = Film.new(details)

    visit '/login'
    email = "example@example.com"
    password = "test"
    @user = User.create!(email: email, password: password)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"

    visit "/movies/#{@movie.api_id}"
  end

  describe 'When I visit the movie details page' do
    it 'can see button to create a viewing party' do
      expect(page).to have_button('Create Viewing Party for Movie')
      click_button 'Create Viewing Party for Movie'
      expect(current_path).to eq('/viewing-party/new')
    end

    it 'can see title, rating, run time, genres, and summary for movie' do
      genres = @movie.genres

      expect(page).to have_content(@movie.title)
      expect(page).to have_content(@movie.rating)
      expect(page).to have_content(@movie.format_time(@movie.runtime))
      expect(genres.size).to eq(3)
      expect(@movie.genres).to be_an(Array)
      expect(page).to have_content(@movie.summary)
    end

    it 'can see list of first 10 cast members names and characters' do
      null = nil
      endpoint = {
    "id": 19404,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 35742,
            "known_for_department": "Acting",
            "name": "Shah Rukh Khan",
            "original_name": "Shah Rukh Khan",
            "popularity": 3.814,
            "profile_path": "/iAr3NRkU9KuPX7jI9ePPeq7zVsc.jpg",
            "cast_id": 1,
            "character": "Raj Malhotra",
            "credit_id": "52fe47d69251416c750a71a1",
            "order": 0
        },
        {
            "adult": false,
            "gender": 1,
            "id": 55061,
            "known_for_department": "Acting",
            "name": "Kajol",
            "original_name": "Kajol",
            "popularity": 1.861,
            "profile_path": "/cwum24EsxNwpcEsboKkudiGySLY.jpg",
            "cast_id": 2,
            "character": "Simran Singh",
            "credit_id": "52fe47d69251416c750a71a5",
            "order": 1
        },
        {
            "adult": false,
            "gender": 2,
            "id": 691,
            "known_for_department": "Acting",
            "name": "Amrish Puri",
            "original_name": "Amrish Puri",
            "popularity": 1.298,
            "profile_path": "/f9F456K0ydJCIIUS5YSmQWAgEgI.jpg",
            "cast_id": 3,
            "character": "Chaudhry Baldev Singh",
            "credit_id": "52fe47d69251416c750a71a9",
            "order": 2
        },
        {
            "adult": false,
            "gender": 2,
            "id": 6217,
            "known_for_department": "Acting",
            "name": "Anupam Kher",
            "original_name": "Anupam Kher",
            "popularity": 1.535,
            "profile_path": "/62IEjVcbXTzgM29lP2vDSPfeHae.jpg",
            "cast_id": 8,
            "character": "Dharamvir Malhotra",
            "credit_id": "52fe47d69251416c750a71c3",
            "order": 3
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35759,
            "known_for_department": "Acting",
            "name": "Satish Shah",
            "original_name": "Satish Shah",
            "popularity": 0.6,
            "profile_path": "/yLZtBHVkWUIPWcrsWHeVsRG7BwH.jpg",
            "cast_id": 9,
            "character": "Ajit Singh",
            "credit_id": "52fe47d69251416c750a71c7",
            "order": 4
        },
        {
            "adult": false,
            "gender": 1,
            "id": 146971,
            "known_for_department": "Acting",
            "name": "Farida Jalal",
            "original_name": "Farida Jalal",
            "popularity": 0.6,
            "profile_path": "/qLlAHvTwQw6A91G2CLptlcUMYQZ.jpg",
            "cast_id": 54,
            "character": "Lajwanti 'Lajjo' Singh",
            "credit_id": "57a30dbe925141276900048b",
            "order": 5
        },
        {
            "adult": false,
            "gender": 1,
            "id": 146972,
            "known_for_department": "Acting",
            "name": "Achala Sachdev",
            "original_name": "Achala Sachdev",
            "popularity": 0.93,
            "profile_path": "/wW9YuDZdglCP29CScTbGZvWHAuh.jpg",
            "cast_id": 10,
            "character": "Simran's Grandmother",
            "credit_id": "52fe47d69251416c750a71cb",
            "order": 6
        },
        {
            "adult": false,
            "gender": 1,
            "id": 78248,
            "known_for_department": "Acting",
            "name": "Himani Shivpuri",
            "original_name": "Himani Shivpuri",
            "popularity": 0.685,
            "profile_path": "/gUCyskh3PnNdRJgxNSOxM0hoMKP.jpg",
            "cast_id": 11,
            "character": "Simran's Aunt",
            "credit_id": "52fe47d69251416c750a71cf",
            "order": 7
        },
        {
            "adult": false,
            "gender": 1,
            "id": 146973,
            "known_for_department": "Acting",
            "name": "Pooja Ruparel",
            "original_name": "Pooja Ruparel",
            "popularity": 1.22,
            "profile_path": "/evHnj6s0Z2sbV1Mq0dfXxQQU8Mf.jpg",
            "cast_id": 12,
            "character": "Rajeshwari / Chutki",
            "credit_id": "52fe47d69251416c750a71d3",
            "order": 8
        },
        {
            "adult": false,
            "gender": 1,
            "id": 146974,
            "known_for_department": "Acting",
            "name": "Mandira Bedi",
            "original_name": "Mandira Bedi",
            "popularity": 1.42,
            "profile_path": "/l50tq0OwzIxE4Z5JXDUSQvqCltN.jpg",
            "cast_id": 13,
            "character": "Preeti Singh",
            "credit_id": "52fe47d69251416c750a71d7",
            "order": 9
        },
        {
            "adult": false,
            "gender": 2,
            "id": 69709,
            "known_for_department": "Acting",
            "name": "Uday Chopra",
            "original_name": "Uday Chopra",
            "popularity": 0.716,
            "profile_path": "/bHmH00vJNavpf5BgSuBeUSPB9bj.jpg",
            "cast_id": 36,
            "character": "Man on bike infront of Kajo",
            "credit_id": "57a305869251410c7d000979",
            "order": 10
        },
        {
            "adult": false,
            "gender": 2,
            "id": 85696,
            "known_for_department": "Acting",
            "name": "Parmeet Sethi",
            "original_name": "Parmeet Sethi",
            "popularity": 0.6,
            "profile_path": "/luVoLpN8PCG5iY6ZAWoKBOEttet.jpg",
            "cast_id": 37,
            "character": "Kuljeet",
            "credit_id": "57a305909251416b97003d21",
            "order": 11
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35736,
            "known_for_department": "Production",
            "name": "Karan Johar",
            "original_name": "Karan Johar",
            "popularity": 0.851,
            "profile_path": "/2CefVfQ47sglDBh61ywatWCk0q9.jpg",
            "cast_id": 41,
            "character": "Rocky",
            "credit_id": "57a305b29251417c57000d9b",
            "order": 12
        },
        {
            "adult": false,
            "gender": 0,
            "id": 631226,
            "known_for_department": "Writing",
            "name": "Arjun Sablok",
            "original_name": "Arjun Sablok",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 42,
            "character": "Roby",
            "credit_id": "57a305bec3a368295b000e08",
            "order": 13
        },
        {
            "adult": false,
            "gender": 1,
            "id": 102252,
            "known_for_department": "Costume & Make-Up",
            "name": "Anaita Shroff Adajania",
            "original_name": "Anaita Shroff Adajania",
            "popularity": 0.617,
            "profile_path": "/yLDxdFAcESXvsfgZKv8ob8TSWvw.jpg",
            "cast_id": 43,
            "character": "Sheena",
            "credit_id": "57a305c99251416b97003d39",
            "order": 14
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661299,
            "known_for_department": "Acting",
            "name": "Hemlata Deepak",
            "original_name": "Hemlata Deepak",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 51,
            "character": "Simran's friend",
            "credit_id": "57a30d8dc3a3682fa7004c09",
            "order": 15
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1427907,
            "known_for_department": "Acting",
            "name": "Lalit Tiwari",
            "original_name": "Lalit Tiwari",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 52,
            "character": "Simran's Uncle",
            "credit_id": "57a30d979251410ca8000bca",
            "order": 16
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661291,
            "known_for_department": "Acting",
            "name": "Baby Raashi",
            "original_name": "Baby Raashi",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 64,
            "character": "",
            "credit_id": "5d6a29f30929f6001645556e",
            "order": 17
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661293,
            "known_for_department": "Acting",
            "name": "Baby Nupur",
            "original_name": "Baby Nupur",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 65,
            "character": "",
            "credit_id": "5d6a29f80929f60012455698",
            "order": 18
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1661294,
            "known_for_department": "Acting",
            "name": "Shanker Iyer",
            "original_name": "Shanker Iyer",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 66,
            "character": "",
            "credit_id": "5d6a29fe9d8939001000ee6c",
            "order": 19
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2400262,
            "known_for_department": "Acting",
            "name": "Rajesh Bhatija",
            "original_name": "Rajesh Bhatija",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 67,
            "character": "",
            "credit_id": "5d6a2a029d8939001200f836",
            "order": 20
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661296,
            "known_for_department": "Acting",
            "name": "Govind Khatri",
            "original_name": "Govind Khatri",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 68,
            "character": "",
            "credit_id": "5d6a2a080929f600124556a5",
            "order": 21
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661297,
            "known_for_department": "Acting",
            "name": "Mansoor Merchant",
            "original_name": "Mansoor Merchant",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 69,
            "character": "",
            "credit_id": "5d6a2a0d9d8939001000ee88",
            "order": 22
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661298,
            "known_for_department": "Acting",
            "name": "Mohit Kumar",
            "original_name": "Mohit Kumar",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 70,
            "character": "",
            "credit_id": "5d6a2a119d8939001400f970",
            "order": 23
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661300,
            "known_for_department": "Acting",
            "name": "Damyanti Puri",
            "original_name": "Damyanti Puri",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 71,
            "character": "",
            "credit_id": "5d6a2a277776f00012737e77",
            "order": 24
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2400263,
            "known_for_department": "Acting",
            "name": "Surendra Rahi",
            "original_name": "Surendra Rahi",
            "popularity": 0.6,
            "profile_path": null,
            "cast_id": 73,
            "character": "Guest in the song Mehendi Laga Ke Rakhna (uncredited)",
            "credit_id": "5d6a2a8c7776f0000f738808",
            "order": 25
        }
    ],
    "crew": [
        {
            "adult": false,
            "gender": 1,
            "id": 8311,
            "known_for_department": "Crew",
            "name": "Farah Khan",
            "original_name": "Farah Khan",
            "popularity": 1.052,
            "profile_path": "/zsOx5FJKsws1SUw53hHRAaOlwvY.jpg",
            "credit_id": "57a3054a9251417c57000d7a",
            "department": "Crew",
            "job": "Choreographer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35770,
            "known_for_department": "Directing",
            "name": "Yash Chopra",
            "original_name": "Yash Chopra",
            "popularity": 0.656,
            "profile_path": "/uDthb94NlawtgRT8BKufFkZdJR5.jpg",
            "credit_id": "57a304a39251410cd20008a5",
            "department": "Production",
            "job": "Producer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35771,
            "known_for_department": "Production",
            "name": "Aditya Chopra",
            "original_name": "Aditya Chopra",
            "popularity": 1.4,
            "profile_path": null,
            "credit_id": "57a3042b9251412769000193",
            "department": "Writing",
            "job": "Screenplay"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35771,
            "known_for_department": "Production",
            "name": "Aditya Chopra",
            "original_name": "Aditya Chopra",
            "popularity": 1.4,
            "profile_path": null,
            "credit_id": "52fe47d69251416c750a71af",
            "department": "Directing",
            "job": "Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35771,
            "known_for_department": "Production",
            "name": "Aditya Chopra",
            "original_name": "Aditya Chopra",
            "popularity": 1.4,
            "profile_path": null,
            "credit_id": "5d6a2a3a7776f0000f7387b8",
            "department": "Writing",
            "job": "Dialogue"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35771,
            "known_for_department": "Production",
            "name": "Aditya Chopra",
            "original_name": "Aditya Chopra",
            "popularity": 1.4,
            "profile_path": null,
            "credit_id": "57a30453c3a3682fa700493f",
            "department": "Writing",
            "job": "Story"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 35740,
            "known_for_department": "Art",
            "name": "Sharmishta Roy",
            "original_name": "Sharmishta Roy",
            "popularity": 0.6,
            "profile_path": "/qCCd7KVlZzV1xxFoq9s6amiqSPF.jpg",
            "credit_id": "57a304c1c3a368295b000dbb",
            "department": "Art",
            "job": "Art Direction"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 35736,
            "known_for_department": "Production",
            "name": "Karan Johar",
            "original_name": "Karan Johar",
            "popularity": 0.851,
            "profile_path": "/2CefVfQ47sglDBh61ywatWCk0q9.jpg",
            "credit_id": "5ca568780e0a265bd6b4e919",
            "department": "Costume & Make-Up",
            "job": "Costume Design"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 69709,
            "known_for_department": "Acting",
            "name": "Uday Chopra",
            "original_name": "Uday Chopra",
            "popularity": 0.716,
            "profile_path": "/bHmH00vJNavpf5BgSuBeUSPB9bj.jpg",
            "credit_id": "57a304969251410cd20008a2",
            "department": "Production",
            "job": "Associate Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 70849,
            "known_for_department": "Sound",
            "name": "Jatin Pandit",
            "original_name": "Jatin Pandit",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "59133e4e9251414eca0549ff",
            "department": "Sound",
            "job": "Music Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 82079,
            "known_for_department": "Directing",
            "name": "Manmohan Singh",
            "original_name": "Manmohan Singh",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5b34ebb59251413cab01b500",
            "department": "Camera",
            "job": "Director of Photography"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 108938,
            "known_for_department": "Sound",
            "name": "Asha Bhosle",
            "original_name": "Asha Bhosle",
            "popularity": 0.695,
            "profile_path": "/vOIKyZIMNHYkeOeGNxEqq2vKc5A.jpg",
            "credit_id": "59133d719251414e89059263",
            "department": "Sound",
            "job": "Playback Singer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 133179,
            "known_for_department": "Sound",
            "name": "Lalit Pandit",
            "original_name": "Lalit Pandit",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "59133e219251414ead053d34",
            "department": "Sound",
            "job": "Music Director"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 146970,
            "known_for_department": "Writing",
            "name": "Javed Siddiqui",
            "original_name": "Javed Siddiqui",
            "popularity": 0.98,
            "profile_path": null,
            "credit_id": "57a3043c9251410c7d000919",
            "department": "Writing",
            "job": "Dialogue"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 565173,
            "known_for_department": "Editing",
            "name": "Keshav Naidu",
            "original_name": "Keshav Naidu",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304739251417c57000d4c",
            "department": "Editing",
            "job": "Editor"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 927644,
            "known_for_department": "Sound",
            "name": "Anand Bakshi",
            "original_name": "Anand Bakshi",
            "popularity": 0.828,
            "profile_path": "/30cipBNZbhXg0VUYU1f3QhUmcor.jpg",
            "credit_id": "57a30566c3a368295b000de4",
            "department": "Sound",
            "job": "Songs"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1113618,
            "known_for_department": "Sound",
            "name": "Udit Narayan",
            "original_name": "Udit Narayan",
            "popularity": 0.6,
            "profile_path": "/2LYPkxyTqlIluiKzYnDMgM5o1Wq.jpg",
            "credit_id": "59133d9f9251414e85057bf2",
            "department": "Sound",
            "job": "Playback Singer"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1113619,
            "known_for_department": "Sound",
            "name": "Kumar Sanu",
            "original_name": "Kumar Sanu",
            "popularity": 0.6,
            "profile_path": "/sD1EDhA8vXiFPfvgY5JBo9Ym1ip.jpg",
            "credit_id": "59133daa9251414e890592b7",
            "department": "Sound",
            "job": "Playback Singer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1148398,
            "known_for_department": "Crew",
            "name": "Saroj Khan",
            "original_name": "Saroj Khan",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a30553c3a3683fa7000a8a",
            "department": "Crew",
            "job": "Choreographer"
        },
        {
            "adult": false,
            "gender": 1,
            "id": 1608033,
            "known_for_department": "Sound",
            "name": "Lata Mangeshkar",
            "original_name": "Lata Mangeshkar",
            "popularity": 0.6,
            "profile_path": "/1JgCDCQpi3KIasQykS3Bd0IHGpp.jpg",
            "credit_id": "59133d959251414edb0584a9",
            "department": "Sound",
            "job": "Playback Singer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661254,
            "known_for_department": "Writing",
            "name": "Pamela Chopra",
            "original_name": "Pamela Chopra",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a3048cc3a3682fa700494d",
            "department": "Production",
            "job": "Associate Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661254,
            "known_for_department": "Writing",
            "name": "Pamela Chopra",
            "original_name": "Pamela Chopra",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "59133ddb9251414e85057c4c",
            "department": "Sound",
            "job": "Playback Singer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661255,
            "known_for_department": "Production",
            "name": "Mahen Vakil",
            "original_name": "Mahen Vakil",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304b7c3a36829a4000f1c",
            "department": "Production",
            "job": "Executive Producer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661256,
            "known_for_department": "Costume & Make-Up",
            "name": "Ravi Indulkar",
            "original_name": "Ravi Indulkar",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304cb92514127690001d9",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661257,
            "known_for_department": "Costume & Make-Up",
            "name": "Pandhari Juker",
            "original_name": "Pandhari Juker",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304d6c3a3686c4a003f8b",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661258,
            "known_for_department": "Costume & Make-Up",
            "name": "Farida Khan",
            "original_name": "Farida Khan",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304e19251416b97003cf6",
            "department": "Costume & Make-Up",
            "job": "Hairstylist"
        },
        {
            "adult": false,
            "gender": 2,
            "id": 1661259,
            "known_for_department": "Costume & Make-Up",
            "name": "Vinod Rathod",
            "original_name": "Vinod Rathod",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304ebc3a368295b000dc9",
            "department": "Costume & Make-Up",
            "job": "Makeup Artist"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661260,
            "known_for_department": "Production",
            "name": "Balakrishnan Iyer",
            "original_name": "Balakrishnan Iyer",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a304f69251410a5f000926",
            "department": "Production",
            "job": "Production Manager"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661261,
            "known_for_department": "Art",
            "name": "Mohammed Kasim",
            "original_name": "Mohammed Kasim",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a30521c3a3683f9700085c",
            "department": "Art",
            "job": "Assistant Art Director"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661262,
            "known_for_department": "Sound",
            "name": "Arunkumar Bose",
            "original_name": "Arunkumar Bose",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a3052b9251410c7d00095c",
            "department": "Sound",
            "job": "Sound Re-Recording Mixer"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1661263,
            "known_for_department": "Costume & Make-Up",
            "name": "Shashikant Shellar",
            "original_name": "Shashikant Shellar",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "57a3053b9251410d2c000928",
            "department": "Costume & Make-Up",
            "job": "Costume Design"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 2400265,
            "known_for_department": "Sound",
            "name": "Ajay Trivedi",
            "original_name": "Ajay Trivedi",
            "popularity": 0.6,
            "profile_path": null,
            "credit_id": "5d6a2aaf9d8939001200f923",
            "department": "Sound",
            "job": "Playback Singer"
        }
    ]
}
      list_of_cast = @movie.cast(endpoint)
      expect(page).to have_content(list_of_cast[0])
      expect(page).to have_content(list_of_cast[9])
    end

    it 'can see count of total reviews, each author and their review' do
      null = nil
      endpoint = {
    "id": 19404,
    "page": 1,
    "results": [
        {
            "author": "MohamedElsharkawy",
            "author_details": {
                "name": "",
                "username": "MohamedElsharkawy",
                "avatar_path": null,
                "rating": null
            },
            "content": "The Dilwale Dulhania Le Jayenge is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best.",
            "created_at": "2017-10-21T12:27:46.145Z",
            "id": "59eb3d42925141565100e901",
            "updated_at": "2017-10-22T00:40:50.358Z",
            "url": "https://www.themoviedb.org/review/59eb3d42925141565100e901"
        }
    ],
    "total_pages": 1,
    "total_results": 1
}
      list_of_reviews = @movie.reviews(endpoint)
      expect(page).to have_content(list_of_reviews[0][0])
      expect(page).to have_content(list_of_reviews[0][1])
      expect(list_of_reviews.size).to eq(1)
    end
  end
end
