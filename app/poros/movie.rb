class Movie
  attr_reader :genres,
              :title,
              :vote_average,
              :runtime,
              :summary,
              :first_ten_cast_members,
              :total_reviews,
              :reviewer_info,
              :id,
              :runtime_in_minutes

  def initialize(movie_id)
    @id = movie_id
    @json_1 = APIServices.title_vote_summary_genres_runtime(movie_id)
    @json_2 = APIServices.cast_info(movie_id)
    @json_3 = APIServices.reviewer_data(movie_id)
    @runtime_in_minutes = @json_1[:runtime]
    @title = @json_1[:original_title]
    @vote_average = @json_1[:vote_average]
    @total_reviews = @json_3[:total_results]
    @summary = @json_1[:overview]
    @runtime = convert_runtime
    @genres = create_genres
    @first_ten_cast_members = find_first_cast_memebers
    @reviewer_info = calculate_reviewer_info
  end

  def create_genres
    @json_1[:genres].map do |hash|
      hash[:name]
    end.join(', ')
  end

  def convert_runtime
    ("#{@json_1[:runtime] / 60} Hours, " + "#{@json_1[:runtime] % 60} Minutes")
  end

  def find_first_cast_memebers
    cast = @json_2[:cast].map do |hash|
      "Character: #{hash[:character]}, Played By: #{hash[:name]}"
    end
    first_ten = cast[0..9]
  end

  def calculate_reviewer_info
    author_details = @json_3[:results].map do |hash|
      hash[:author_details]
      end
    info = author_details.map do |details|
      "Name: #{details[:name]}, Username: #{details[:username]}, Avatar Path: #{details[:avatar_path]}, Rating: #{details[:rating]}"
    end
  end
end
