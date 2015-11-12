# Food Access Finder

In collaboration with the Richmond Health Department, Food Access Finder is a healthy food store finder based on RDH designated healthy Stores

This project is built in NodeJS using [Express](http://expressjs.com/)

Project Lead: [Adam](mailto:adam@codeforamerica.com)


## Installation

You will need to have [git](https://git-scm.com/) and [node](https://nodejs.org/en/) installed on your system in order to run the application. On mac, both can be install via [homebrew](http://brew.sh/).

Clone the repository

    $ git clone <repo url>
    $ cd food-access-finder

Install dependencies

    $ npm install
    $ npm install -g gulp
    $ npm install -g coffee-script

Add local environment variables by creating a `.env` file in the project root directory.

add a variable `MAPBOX_SECRET_KEY` to the file.  Ask [Adam](mailto:adam@codeforamerica.com) (can also be found on Slack) for the api key.

The final `.env` should look like this:

    MAPBOX_SECRET_KEY=<api key>

Run application

    $ npm start

The app is set to listen on port `3000`.
