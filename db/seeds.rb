# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user1 = User.create!(email: 'test@test.com', password: 'test')
user2 = User.create!(email: 'test2@test.com', password: 'test')
user3 = User.create!(email: 'test3@test.com', password: 'test')
Friendship.create!(user: user1, friend: user2)
Friendship.create!(user: user1, friend: user3)
