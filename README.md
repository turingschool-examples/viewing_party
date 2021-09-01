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
    <li>
      <li><a href="#installation">Installation</a></li>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<img width="911" alt="Screen Shot 2021-09-01 at 2 21 36 PM" src="https://user-images.githubusercontent.com/80132364/131747248-db278a4c-0eba-4806-a3b9-c11bbcacccc1.png">


Viewing party is an application that utilizes the Movie DB API. Users can visit our app, register to create an account, and from there find other users to create friends. Once a user registers an account, the user can utilize login/logout features. As a user and as a guest, you can discover movies by searching for a specific movie, or viewing the current top 40 popular movies section. When a user finds a movie they want to see, they can view a movie page which shows the details for the movie such as cast and any reviews available. 

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
* Figaro
* Faraday
* Factory Bot Rails
* Faker
* MailCatcher


## Installation

1. To run this project locally, you will need ruby 5.2.6 and well as 2.7.2.
2. Get a free API Key at [www.themoviedb.org](https://www.themoviedb.org/documentation/api)
3. Clone the repo
   ```sh
   git clone https://github.com/gunnarrunner/viewing_party.git
   ```
4. Install NPM packages
   ```sh
   npm install
   ```
5. Enter your API in `config.js`
   ```JS
   const API_KEY = 'ENTER YOUR API';
   ```

## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Img Shields](https://shields.io)
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Pages](https://pages.github.com)
* [Animate.css](https://daneden.github.io/animate.css)
* [Loaders.css](https://connoratherton.com/loaders)
* [Slick Carousel](https://kenwheeler.github.io/slick)
* [Smooth Scroll](https://github.com/cferdinandi/smooth-scroll)
* [Sticky Kit](http://leafo.net/sticky-kit)
* [JVectorMap](http://jvectormap.com)
* [Font Awesome](https://fontawesome.com)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/gunnarrunner/viewing_party/contributors
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/gunnar-runkle/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url1]: https://www.linkedin.com/in/matt-toensing/
[product-screenshot]: images/screenshot.png





# Viewing Party

This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`


## Versions

- Ruby 2.7.2

- Rails 5.2.5

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)
