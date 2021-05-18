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
User.create!(user_name: 'joey@gmail.com', password: '123')
User.create!(user_name: 'joe@gmail.com', password: '123')
User.create!(user_name: 'ryan@gmail.com', password: '123')
User.create!(user_name: 'raylene@gmail.com', password: '123')
User.create!(user_name: 'alexander@gmail.com', password: '123')
User.create!(user_name: 'alex@gmail.com', password: '123')
User.create!(user_name: 'allen@gmail.com', password: '123')
User.create!(user_name: 'joanna@gmail.com', password: '123')
