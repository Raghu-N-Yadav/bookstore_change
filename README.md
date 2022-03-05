# README
> # HEROKU Deployment link  :: https://bookstore-raghu.herokuapp.com

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 

  1. Check gemfile

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

*HOW to run

> rails c 

open a rails console

> rails s 

starts server

> rspec 

Run all test cases

> rspec spec/models/supplier_spec.rb:26

Another command ro run test cases

> rails c --sandbox

 use to play round database

> bundle install 

To have dependencies in your working machine

> rails db:migrate:redo VERSION=20220215062336

Use it after making changes in a migration file

> rails g model Student name:string email:string bookIssued:string issuedDate:date returnDate:date

Create a model 

> rails _5.2.6_ new bookstore

create a rails project

> rails generate rspec:request admin

Genrate a rpec testing file 