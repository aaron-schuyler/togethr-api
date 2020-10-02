# togethr API


this is the backend for togethr, a webapp for submitting tickets for mutual aid assistance.

to use, you also need the togethr react frontend which can be found [here](https://github.com/aaron-schuyler/togethr)

follow the installation instructions on the serverside, and then to run simply install dependencies, set up the database, and start the server:

`bundle install`

`rails db:migrate`

you can seed the DB with premade categories and skills or change the db/seeds.rb file to make your own

`rails db:seed`

`rails s`

This project is licensed under the [MIT license](https://choosealicense.com/licenses/mit/)
