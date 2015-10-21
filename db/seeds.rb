# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create! :first_name => 'Betty', :last_name => 'White', :email => 'betty@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Outlandish'
user = User.create! :first_name => 'Oprah', :last_name => 'Winfrey', :email => 'oprah@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Midlandish'
user = User.create! :first_name => 'Ronald', :last_name => 'Swanson', :email => 'ron@test.com', :phone => '5105551234', :password => '11111111', :password_confirmation => '11111111', :neighborhood => 'Thousand Oaks Hamlet'

def make_groups
  Group.create! name: 'Movies', description: 'yo'
  Group.create! name: 'Knitting', description: 'yo'
  Group.create! name: 'Computer', description: 'yo'
  Group.create! name: 'Poker', description: 'yo'
  Group.create! name: 'Bingo', description: 'yo'
  Group.create! name: 'Music', description: 'yo'
  Group.create! name: 'Reading', description: 'yo'
  Group.create! name: 'Politics', description: 'yo'
  Group.create! name: 'Education', description: 'yo'
  Group.create! name: 'Kites', description: 'yo'
  Group.create! name: 'Pool', description: 'yo'
  Group.create! name: 'Checkers', description: 'yo'
  Group.create! name: 'Chess', description: 'yo'
  Group.create! name: 'Frisbee', description: 'yo'
  Group.create! name: 'Travel', description: 'yo'
  Group.create! name: 'Television', description: 'yo'
end

make_groups

