# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "1@x.com", password: "1", password_confirmation: "1")

@user2 = User.create(email: "2@x.com", password: "1", password_confirmation: "1")
@user3 = User.create(email: "3@x.com", password: "1", password_confirmation: "1")

# @friendship = Friendship.create(user: @user, friend: @user2)
# @friendship2 = Friendship.create(user: @user2, friend: @user)
#
# @movie = Movie.create(title: "xxx")
#
# @party = @user.parties.create(movie_id: @movie.id, datetime: Time.now)
#
# @user.friends.first
#
# @guest = PartyGuest.create(friendship_id: @friendship.id, party_id: @party.id)
#
