## Viewing Party

Viewing Party in an application in which a user can access information about motion pictures from the database of TheMovieDB.org. By way of consuming various free API endpoints available on the TheMovieDB.org, Viewing Party can search for and render specific film information to users. Registered users can find other registered users and add them as friends. Registered users also have the ability to schedule and create a viewing party for any movie found on the database, and any friends of that user can be invited to the viewing party.

Viewing Party is live and running @ https://guarded-refuge-05465.herokuapp.com

## Group Members
https://github.com/carson-jardine

https://github.com/abcdefghijohn

https://github.com/Todd-Estes

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`

## Schema

![alt text](https://user-images.githubusercontent.com/66448493/101704525-30729400-3a42-11eb-9614-2a2db85f750e.png)

## User Roles

**Visitor** A visitor has the ability to keyword search for any film located on TheMovieDB.org, and they can also see the top 40 highest reviewed films located on the database, as well. Users can select an information page for any available film which includes the film's title, genre info, cast, average review, number of reviews, and indivual reviewer information.

**Registered User** - A registerd user has all of the capabilities of a regular visitor, with the additional abilities of searching and befriending other registered users and inviting them to scheduled viewing parties for any film on the database.

## Learning Goals

**Database**

-Created Schema

-Designed One-to-Many, Many-to-Many Relationships

**Active Record** 

-Joined multiple tables of data

-Utilized queries to calulate and group data based on mulitple attributes

**Authentication and Authorization**

-Namespaced Routes

-Used Sessions for login/logout functionality

-Used Sessions for storing information

-Limited functionality to authorized users

-Used BCrypt to hash user passwords

**Rails**

-Used filters in Rails controller (before_action)

-Followed MVC principles

-Utitlized and followed basic HTML and CSS conventions to render view templates


## Screenshots

![image](https://user-images.githubusercontent.com/66448493/101707913-72eb9f00-3a49-11eb-9cec-ca1effb2a7d0.png)
![image](https://user-images.githubusercontent.com/66448493/101708358-500dba80-3a4a-11eb-9eac-e47814ef06e0.png)
![image](https://user-images.githubusercontent.com/66448493/101708212-08872e80-3a4a-11eb-81b5-d7babcd4de84.png)














