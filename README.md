# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.

## Versions

- Ruby 2.5.3
- Rails 5.2.4.3

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

# Viewing Party

This application is used to search for movies by title, or discover new movies by top-rated, then create "Viewing Parties" with friends who
are also users of the application.

## Summary

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)
  - [Contributing](#contributing)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

### Installing

A step by step series of examples that tell you how to get a development
env running

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
  Key Gems Include:
  - weblock/rspec
  - vcr
  - faraday
  - figaro
  - factory_bot_rails'
  - faker

3. Setup the database: 
- `rails db:create`
- `rails db:migrate`
- `rails db:seed` (Will populate seeded users to show functionality of adding Friends, creating Viewing Parties)

To create a viewing party:
1. Register by clicking the link "New to Viewing Party? Register Here."
2. From your Dashboard, you can add several friends by entering their emails: friend@email.com, pal@email.com, buddy@email.com.
- You will see your friends added to your friends list on your Dashboard!
3. Next click "Discover Movies" to get the party started!
4. On the Discover page, you have the option for searching for a specific movie by title, or searching the Top 40 movies in the App.
5. You can click on the name of any movie to see details about that movie including genre(s), cast, ratings, reviews, runtime, etc...
6. Once you've found the movie you wish to watch, click "Create New Viewing Party"
7. From the New Viewing Party page, you can choose when to host the movie (date and time) and check off what friends you want to invite!
8. Once you click "Create Party" you will see your newly created Viewing Party on your dashboard! Grab your popcorn!

## Running the tests
1. Be sure you already ran `bundle install`
2. `bundle exec rspec`

### Break down into end to end tests

- Models: `bundle exec rspec spec/models`
- Features: `bundle exec rspec spec/features`
- Services(Calls to API): `bundle exec rspec spec/services`
- Facades: `bundle exec rspec spec/facades`

### Testing Tools
  - Factory Bot
  - Faker
  - RSpec
  - Webmock
  - VCR
  - Travis CI
  - Shoulda-matchers
  - Simplecov
  - Capybara

## Deployment
  - App is hosted on [Heroku](https://limitless-castle-72832.herokuapp.com/)

## Built With
  - [The Movie Database API](https://developers.themoviedb.org/3)
  - We used Ruby version [2.5.3](https://ruby-doc.org/core-2.5.3/)
  - Ruby on Rails version [5.2.4.3](https://rubygems.org/gems/rails/versions/5.2.4.3)

## Versioning
  - [GitHub Repo](https://github.com/lkriffell/viewing_party)

## Authors
  - **Logan Riffell** - *Provided README Template* -
    [GitHub](https://github.com/coreycartercodes)
  - **Corey Carter** - *Provided README Template* -
    [GitHub](https://github.com/lkriffell)
    
## Acknowledgments
  - Thank you to [The Movie Database API](https://developers.themoviedb.org/3) for allowing us to use their data collections