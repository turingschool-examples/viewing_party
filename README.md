# Viewing Party [![Build Status](https://app.travis-ci.com/Isikapowers/viewing_party.svg?branch=main)](https://app.travis-ci.com/Isikapowers/viewing_party)

## Table of contents
* [Background_and_Description](#background-and-description)
* [Learning Goals](#learning-goals)
* [Requirements](#requirements)
* [Database Schema](#database-schema)
* [Setup](#setup)
* [Live App](#live-app)
* [Tools Used](#tools-used)
* [Contributors](#contributors)

## Background and Description

"Viewing Party" is an application in which users can explore movie options and create a viewing party event for the user and friend's.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships.
- Practice loading csv files to the database.
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced ActiveRecord techniques to perform complex database queries.
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code.

## Requirements
- Rails 5.2.5
- Ruby 2.7.2
- PostgreSQL
- Travis CI
- Test all feature and model code
- GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- Deploy completed code to Heroku

## Database Schema
<img width="597" alt="Screen Shot 2021-10-11 at 9 58 51 PM" src="https://user-images.githubusercontent.com/72399033/136889076-b63f675b-90b8-4531-b35a-87a336a05347.png">

## Setup
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
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
|                | RuboCop              |

## Contributors

- [Isika Powers](https://github.com/Isikapowers/)
- [Erike Kischuk](http://github.com/eakischuk/)
