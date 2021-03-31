require 'rails_helper'

RSpec.describe Viewer, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :viewing_event}
  end

  describe 'class methods' do
    describe '::create_event_viewers' do
      it "creates a viewer for all friends passed in argument for an event " do
        user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
        user_2 = User.create!(email: 'grumpy@email.com', password: 'grumpyperson1')
        user_3 = User.create!(email: 'sleepy@email.com', password: 'sleepyperson1')
        user_4 = User.create!(email: 'dopey@email.com', password: 'dopeyperson1')
        friend_1 = Friend.create!(follower_id: user_1.id, followed_id: user_2.id)
        friend_2 = Friend.create!(follower_id: user_1.id, followed_id: user_3.id)
        friends = user_1.followed.map {|friend| friend.id}
        friend_3 = Friend.create!(follower_id: user_1.id, followed_id: user_4.id)
        movie = Movie.create!(movie_db_id: 1, title: 'Star Wars: Return of the Jedi', runtime: 124)
        date = Time.now.strftime("%Y-%m-%d")
        time = Time.now.strftime("%H:%M")
        event = ViewingEvent.create!(
          duration: movie.runtime,
          start_date: date,
          start_date_time: time,
          user_id: user_1.id,
          movie_id: movie.id)
        Viewer.create_event_viewers(friends, event.id)

        expect(event.viewers.count).to eq(2)
        expect(event.viewers.first.user_id).to eq(user_2.id)
        expect(event.viewers.last.user_id).to eq(user_3.id)
        expect(event.viewers.include?(user_4.id)).to eq(false)
      end
    end
  end
end
