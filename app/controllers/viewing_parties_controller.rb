class ViewingPartiesController < MoviesController

  def new
    @movie = Movie.details(params[:id])
    friends_ids = Friendship.where(user_id: current_user.id).pluck("friend_id")
    @friends = User.find(friends_ids)
  end
end
