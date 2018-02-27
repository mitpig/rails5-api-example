# Introduction
This is a simple project of a basic CRUD API built with Ruby on Rails 5 and RSpec

### dependencies
* Ruby 2.4.1
* Rails 5.1.4

### Setup
First of all you must clone the repository on your own directory:
```
git clone https://github.com/elsilentforce/rails5-api-example
```

Once you clone the repo, you must to install all the gems required to run this application:
```
bundle install
```

##### Initializing Database
Now in the application directory run the following command:
```
rails db:setup
```
It will create the application database with some test users on it.


### Endpoints
The API responds to the following endpoings

Method       | URL                      | description
------------ | -------------            | -------------
POST         | /api/v1/login            | Authenticates a User against the database.
POST         | /api/v1/users            | Creates a new User based on the given params.
GET          | /api/v1/users/:username  | Shows an specific User data.
PUT          | /api/v1/users/:username  | Updates an specific User based on the given params.
DELETE       | /api/v1/users/:username  | Deletes an specific user.

To make any CRUD request, in addition to the params, you must to add the header `Authorization` with the value of an active JSON Web Token, this last thing can be obtained on the login response, every token is setted to last 24 hrs.

### Test Suite
The application is built using Test Driven Development with RSpec gem.
To run the witten tests you just need to execute the following command:
```
rspec
```
It will execute every REST operation and it will gives you a friendly message indicating if everything went good or not.
