# <div align="center"> Viewing Party



<div align="center"><img src = "https://raw.githubusercontent.com/zisiszikos/the-movie-db-example/master/tmdb.png"/></div>

## Development Team
[Curtis Bartell](https://github.com/c-bartell) <br>
[Connor Ferguson](https://github.com/cpfergus1) <br>
[Brian Liu](https://github.com/badgerbreezy) <br>

## Viewing Party Functionality
Viewing Party is a Ruby on Rails application that allows users to explore movie options and create multiple viewing parties with their friends. Users can search for movies or discover new ones and upon creating a viewing party, the user's friends will receive an email with viewing party details. The application consumes [The Movie Database (TMDB) API](https://developers.themoviedb.org/3/getting-started/introduction) endpoints.

*Screenshot placeholder*

## How to Install Viewing Party
<h3>Prerequisites:</h3>
  <ul>
    <li>Ruby 2.5.3</li>
    <li>Rails 5.2.4.3</li>
  </ul>
<h3>Instructions</h3>
<ol>
  <li>Fork the repository
  <li>Clone your fork
  <li>Install gem packages and setup the database from the command line:
      <ul>
        <li>
         
`bundle install`
        <li>
  
`rails db:{create,migrate}`
      </ul>
  <li>
  
  `bundle exec rspec` to run the test suite
</ol>

<h3>Dev Environment</h3>

The development environment is run with `rails s` and can be viewed at **localhost:3000**

## Features

- Search for registered friends by email and add them to their friends list.
- Discover the 40 top-rated movies from TMDB.
- Search for movies by keyword.
- Explore recommended and similar movie options.
- Create viewing parties and send party details to invited friends.


## Statistics
   ![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Code-Ruby-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)   ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Code-CSS-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)

