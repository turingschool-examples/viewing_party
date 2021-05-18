# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserParty.destroy_all
Party.destroy_all
Friendship.destroy_all
User.destroy_all

# Users
user1 = User.create!(user_name: 'Joey@gmail.com', password: '123')
user2 = User.create!(user_name: 'Joe@gmail.com', password: '123')
user3 = User.create!(user_name: 'Ryan@gmail.com', password: '123')
user4 = User.create!(user_name: 'Alexander@gmail.com', password: '123')
