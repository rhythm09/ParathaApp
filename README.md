# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version-3.0.0

* System dependencies- ruby,rails yarn,nodejs,postgresql

* Configuration- ubantu 20.04,rails 6.1.3,psql (PostgreSQL) 13.2,yarn 1.22.5,nodejs v12.18.2


* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Install ruby via rvm
Here is the link
https://github.com/rvm/ubuntu_rvm

* Install rails,nodejs,yarn
Here is the link
https://guides.rubyonrails.org/getting_started.html

* Install postgresql
Here is the link
https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

* Checkout repository
git clone https://github.com/rhjain09/ParathaApp.git

* Create database.yml file
Copy the sample database.yml file and edit the database configuration as required.

cp config/database.yml.sample config/database.yml

* Create and setup the database
bin/rails db:create
bin/rails db:migrate

* start rails server
bin/rails server
go to link http://127.0.0.1:3000

* heroku deployment link
https://parathaapp.herokuapp.com/

