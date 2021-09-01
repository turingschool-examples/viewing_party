[![Contributors][contributors-shield]][contributors-url]
Gunnar Runkle: [![Gunnar][linkedin-shield]][linkedin-url]
Matt Toensing: [![Matt][linkedin-shield]][linkedin-url1]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://user-images.githubusercontent.com/80132364/131535767-3e07fa12-1229-4c48-a37d-01c6cd329627.png" alt="Logo" width="80" height="80">
  </a>


  <h3 align="center">Viewing Party</h3>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#gems-used">Gems Used</a></li>
      </ul>
    </li>
     <li><a href="#installation">Installation</a></li>
    <li><a href="#future">Future Aspirations</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<img width="911" alt="Screen Shot 2021-09-01 at 2 21 36 PM" src="https://user-images.githubusercontent.com/80132364/131747248-db278a4c-0eba-4806-a3b9-c11bbcacccc1.png">


Viewing party is an application that utilizes the Movie DB API. Users can visit our app, register to create an account, and from there find other users to create friends. Once a user registers an account, the user can utilize login/logout features. User passwords are encrypted with the gem Bcrypt and not saved in our database in the raw form. As a user and as a guest, you can discover movies by searching for a specific movie, or viewing the current top 40 popular movies section. When a user finds a movie they want to see, they can view a movie page which shows the details for the movie such as cast and any reviews available. 

If a user is signed in, they have the option to create a viewing party for that movie. When clicking the button to create a viewing party from the movie page, the user is redirected to page with a form. The form includes the name of the movie, and the length of the movie by default. Date and time can then be selected, and the page will show all of the friends that can be selected with a check box. Then, once the viewing party is created, the the user is defaulted back to the user dashboard, where they will see any viewing parties that they are either hosting or have been invited to.

### Built With

* Ruby 2.7.2
* Ruby on Rails 5.2.6
* [Bootstrap](https://getbootstrap.com)
* HTML
* CSS
* Heroku

#### Gems Used

* Capybara
* Pry
* Bcrypt
* [Figaro](https://github.com/laserlemon/figaro)
* Faraday
* Factory Bot Rails
* Faker
* MailCatcher


## Installation

1. To run this project locally, you will need ruby 2.7.2 and well as Rails 5.2.6.
2. Get a free API Key at [www.themoviedb.org](https://www.themoviedb.org/documentation/api)
3. Clone the repo
   ```sh
   git clone https://github.com/gunnarrunner/viewing_party.git
   ```
4. Change Directories
   ```
   cd viewing_party
   ```
5. Perform Gem installation
    ```
    bundle install
    ```
7. [Figaro Gem Docs can be found here](https://github.com/laserlemon/figaro)
    ```
    bundle exec figaro install
    ```
9. Enter your API in `config/application.yml`
   ```
   movie_key = 'ENTER YOUR API'
   ```
   
   
## Future Aspirations for the Project

We created an email function for this project in development. It has not yet fully been implemeneted, but when a user creates a viewing party and invites friends, an email with the movie title, date and time is sent out to all friends that have been invited. Currently, the gem mailcatcher stops any and all emails from being sent out from our app. 

We would also like to create our own in house reviews for movies, as well as a chat feature. The chat feature would allow users to communicate with each other during the movie via our application. 

## Usage

This application can be found [here](https://arcane-headland-30273.herokuapp.com/) and be used to research movies and create viewing parties with friends. Please feel free to use and enjoy!


## About the Developers

Gunnar Runkle - [Gunnar's LinkedIn](https://www.linkedin.com/in/gunnar-runkle/)

Matt Toensing - [GitHub](https://github.com/matttoensing)
                [Email](matthew.toensing@gmail.com)
                [LinkedIn](https://www.linkedin.com/in/matt-toensing/)


## Acknowledgements
Thank you for the Movie DB for letting us utilize their API. We also would like to thank our wonderful instuctors at the Turing School of Software and Design. 



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/gunnarrunner/viewing_party/contributors
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/gunnar-runkle/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url1]: https://www.linkedin.com/in/matt-toensing/
[product-screenshot]: images/screenshot.png

