# Viewing Party

Viewing Party is an app that allows users to create an account and add friends via email, search through a movie database (brought to you via [The Movie Database](https://themoviedb.org)), find a movie, create a viewing party with a time and date for a movie and invite your friends. User's can look at their dashboard and see a list of all the movies they are hosting and parties they are invited to, including the viewing party details and guest list for each party.

## Authors

  - **Andrew Johnston** -
    [avjohnston](https://github.com/avjohnston)
  - **Kyle Schulz** -
    [kylejschulz](https://github.com/kylejschulz)
  - **Megan Gonzales** -
    [mgonzales26](https://github.com/mgonzales26)

See also the list of
[contributors](https://github.com/kylejschulz/viewing_party/graphs/contributors)
who participated in this project.

## Table Of Contents

  - [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Preview](#preview)
  - [Running the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Acknowledgements](#acknowledgements)

## Getting Started

* Fork and clone this repo [Viewing Party](http://github.com/kylejschulz/repos/viewing_party)
* Run `rails s` from your terminal
* Visit `http://localhost300` to see the app in action.

### Prerequisites

#### Gemfile

![Viewing Party Gemfile](https://user-images.githubusercontent.com/72912074/113220617-ba887780-9240-11eb-84a5-73d04bb065fe.png)

### Preview

![Screen Shot 2021-03-31 at 5 06 48 PM](https://user-images.githubusercontent.com/72912074/113222072-81053b80-9243-11eb-875d-e02bf26532b3.png)

![Screen Shot 2021-03-31 at 5 08 01 PM](https://user-images.githubusercontent.com/72912074/113222183-abef8f80-9243-11eb-92a3-f639a252f714.png)

![Screen Shot 2021-03-31 at 5 09 01 PM](https://user-images.githubusercontent.com/72912074/113222681-bd856700-9244-11eb-86c5-12eede15fdcf.png)


## Running the tests

To run the entire suite, in your terminal, run:
```
bundle exec rspec
```

To run the test suite with `rubocop` and further analyze ruby convention and format, run:
```
bundle exec rubocop
```

## Deployment

* This app is screened through Travis CI before deploying to Heroku.
* An API Key is needed from The Movie Database
  * Create an account through [The Movie Database](https://themoviedb.org)
  * Apply for API Key [The Movie Database](https://themoviedb.org/settings/api)
  * Input API Key to `config/application.yml` as an environment variable

```
tmdb_api: 'your_api_key_here'
```

## Acknowledgments

  - The boat that got stuck in the Suez Canal #neverforget
