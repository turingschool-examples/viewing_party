# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friendship.destroy_all
User.destroy_all

@user_1 = User.create!(email: 'test123@xyz.com', password: 'viewparty')
@user_2 = User.create!(email: 'lola_rabbit@aol.com', password: 'lola')
@user_3 = User.create!(email: 'bugs_bunny@gmail.com', password: 'bugs')
@user_4 = User.create!(email: 'daffy_duck@yahoo.com', password: 'daffy')

Friendship.create!(user: @user_1, friend: @user_2)
Friendship.create!(user: @user_1, friend: @user_3)
Friendship.create!(user: @user_3, friend: @user_4)
