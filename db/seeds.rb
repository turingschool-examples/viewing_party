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

# Parties
party1 = Party.create!(movie_title: 'Mortal Kombat', party_duration: 130, party_date: '2021-06-17', start_time: '19:00',
                       user_id: user1.id, runtime: 110)
party2 = Party.create!(movie_title: 'Pokémon The First Movie: Mewtwo Strikes Back', party_duration: 130, party_date: '2021-05-17', start_time: '19:00',
                       user_id: user1.id, runtime: 75)
party3 = Party.create!(movie_title: 'Mortal Kombat: Annihilation', party_duration: 90, party_date: '2021-05-13',
                       start_time: '17:00', user_id: user2.id, runtime: 72)
party4 = Party.create!(movie_title: "Mortal Kombat Legends: Scorpion's Revenge", party_duration: 90, party_date: '2021-09-15',
                       start_time: '20:00', user_id: user2.id, runtime: 80)

# UserParties
userparty1 = UserParty.create!(user_id: user1.id, party_id: party1.id)
userparty2 = UserParty.create!(user_id: user1.id, party_id: party2.id)
userparty3 = UserParty.create!(user_id: user2.id, party_id: party3.id)
userparty4 = UserParty.create!(user_id: user2.id, party_id: party4.id)
