class Party < ApplicationRecord
  validates :movie, presence: true
  validates :start_time, presence: true

  belongs_to :movie
  has_many :viewers, dependent: :destroy

  def viewer_status(id)
    viewers.find_by(user_id: id).status
  end

  def movie_title
    MovieDbFacade.get_movie_info(movie.mdb_id).title
  end
end
