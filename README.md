# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version
  3.0.0

# System dependencies
 * postgres
 * redis

# Steps to run:

## 1. clone the application and cd into the application.

## 2. Configuration
   > bundle install

## 3. make sure you have the database.yml creds according your local machine.

## 4. Database creation and initialization
   > rake db:create
   > rake db:migrate
   > rake db:seed

## 5. Start sidekiq from the root of your Rails application so the jobs will be processed:
	* bundle exec sidekiq

## Once the above steps are successful, you can check the available jobs for Issuing Rewards Rules on url:
  > /sidekiq

## How to run the test suite
  > bundle exec rspec


* ...