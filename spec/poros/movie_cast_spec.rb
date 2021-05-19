require 'rails_helper'
describe 'MovieCast' do
  it 'abstracts and encapsulates cast data that can be read' do
    cast_info = {
            "adult": false,
            "gender": 1,
            "id": 136347,
            "known_for_department": "Acting",
            "name": "Jessica McNamee",
            "original_name": "Jessica McNamee",
            "popularity": 9.508,
            "profile_path": "/aAfaMEEqD8syHv5bLi5B3sccrM2.jpg",
            "cast_id": 24,
            "character": "Sonya Blade",
            "credit_id": "5d647b30bcf8c9001475e363",
            "order": 1
        }
  cast =  MovieCast.new(cast_info)
  expect(cast.name).to eq "Jessica McNamee"
  expect(cast.character).to eq "Sonya Blade"
  end
end