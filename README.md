# Viewing Party [![Build Status](https://app.travis-ci.com/Isikapowers/viewing_party.svg?branch=main)](https://app.travis-ci.com/Isikapowers/viewing_party)

## Table of contents
* [Description](#description)
* [Learning Goals](#learning-goals)
* [Requirements](#requirements)
* [Database Schema](#database-schema)
* [Setup](#setup)
* [Live App](#live-app)
* [Tools Used](#tools-used)
* [Contributors](#contributors)

## Description

"Viewing Party" is an application in which users can explore movie options and create a viewing party event for the user and friend's.

## Learning Goals
- Practice designing a self referential join relationship and schema.
- Practice API consumption and private API-Key maintenance.
- Practice using OOP principles: utilizing the facade design pattern.
- Utilize advanced ActiveRecord techniques to perform complex database queries.
- Utilize authentication and session.
- Utilize `bcrypt` to secure users' passwords.

## Requirements
- Rails 5.2.5
- Ruby 2.7.2
- PostgreSQL
- Travis CI
- [Movie Database API](https://www.themoviedb.org/)
- Test all feature and model code
- GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- Deploy completed code to Heroku

## Database Schema
<img width="599" alt="Screen Shot 2021-10-20 at 3 11 09 PM" src="https://user-images.githubusercontent.com/72399033/138172813-e892a835-7389-4e37-a70d-247b65ddc249.png">

## Setup
* Fork this repository
* Clone your fork
* [API Key from the movie database](https://developers.themoviedb.org/4/auth/user-authorization-1) is required
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
* Run RuboCop linter with `bundle exec rubocop`.
* Run your development server with `rails s` to see the app in action.

## Live App
[Link to Heroku deployment](https://viewing-party-denver.herokuapp.com)

## Tools Used

| Development    |  Testing             |
| :-------------:| :-------------------:|
| Ruby 2.7.2     | SimpleCov            |
| Rails 5.2.6    | Pry                  |
| HTML5          | Capybara             |
| Bootstrap      | ShouldaMatcher       |
| Atom           | Launchy              |
| Git            | Orderly              |
| Github         | Factorybot/Faker     |
| Github Project | Faraday              |
| Postico        | RSpec                |
| Heroku         | Travis CI            |
| Bcrypt         | RuboCop              |

## Contributors

- [Isika Powers](https://github.com/Isikapowers/)
- [Erika Kischuk](http://github.com/eakischuk/)
