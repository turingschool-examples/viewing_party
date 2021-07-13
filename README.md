# Viewing Party

This is a project for Turing Mod3 back-end completed in 10 days. Rails based program to search for movies and invite friends to viewing parties for those movies. We search for movies using the IMDB API and provide review and cast information in addition to basic movie data.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Migrate the database: `rails db:migrate`
5. Get an API key from imdb.com
6. Add your API key to the `.env` folder assigned to the `IMDB_API` variable!
   [Screen Shot 2021-07-13 at 9 33 38 AM](https://user-images.githubusercontent.com/78388882/125481379-e59d6707-6fc7-4c19-bde8-3788857fd114.png)
7. Run `rails s` and open localhost:3000 in your browser!

## USING THE APP

* Create an account:
  - From the welcome page, `/`, click on 'Register New Account'.
  - Enter your email address and a password.
  - Click on the 'Register' button
* Adding Friends:
  - From the `/dashboard` look above the 'Your Friends' Banner
  - Enter the email of a friend who already has an account in the 'Your Friends Email' field
  - Click on the 'Add Friend' button.
* Searching for Moives:
  - From the `/dashboard` click on 'Discover Top 40 Movies'
    * This will show you the current 40 most popular movies.
  - At the top of the page enter a complete or partial movie title in the 'Search by Title' field.
  - Click 'Find Top Rated Movies' to display the top 40 movies containing your search terms.
* Creating a Viewing Party

## Versions

- Ruby 2.7.2

- Rails 5.2.5
