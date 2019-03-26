# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Tristan Berezowski contributed the following features to this application:

- product is sold out feature
- admins can view and create all categories
- user login/registration/logout
- view order details after payment
- order receipt is emailed after payment
- admin security using .env added
- empty cart does not allow checkout
- products can be rated and reviewed by users
- automated testing for product creation

## Demo of implemented features

![Gif of Jungle Demo](https://github.com/tristanberezowski/jungle-rails/blob/master/demo.gif)

## Tech Stack

###### Rails / StripeAPI / HTML ERB / SASS / PostgreSQL / BootStrap
###### Rspec / Capybara / Database Cleaner / PhantomJS

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe