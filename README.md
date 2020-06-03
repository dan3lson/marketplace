# Marketplace

An API-only Rails app to buy and sell goods. Originally developed as a
proof-of-concept for authorization via Pundit and CanCancan.

Things to note:

* Ruby version: 2.7.1
* Rails version: 6.0.3
* Postgresql database

To run this repo locally:
- clone it
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

* Run the lite test suite with `bundle exec rspec`