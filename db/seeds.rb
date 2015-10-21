# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create! :first_name => 'Betty', :last_name => 'White', :email => 'betty@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Outlandish'
user = User.create! :first_name => 'Oprah', :last_name => 'Winfrey', :email => 'oprah@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Midlandish'
user = User.create! :first_name => 'Ronald', :last_name => 'Swanson', :email => 'ron@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Thousand Oaks Hamlet', :photo => '/images/:style/ron-swanson.jpg'