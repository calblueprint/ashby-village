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

def make_users
  User.create! first_name: 'Laila', last_name: 'Rowe', email: 'blah@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Mark', last_name: 'Rowe', email: 'blah1@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Jenny', last_name: 'Rowe', email: 'blah2@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Sandra', last_name: 'Rowe', email: 'blah3@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'John', last_name: 'Rowe', email: 'blah4@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Eric', last_name: 'Rowe', email: 'blah5@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Dennis', last_name: 'Rowe', email: 'blah6@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
  User.create! first_name: 'Ajay', last_name: 'Rowe', email: 'blah7@gmail.com', phone: '917', cell_phone: '917', date_of_birth: 'date', password: 'okokokokok'
end

def make_user_groups
  UserGroup.create! user_id: 1, group_id: 1
  UserGroup.create! user_id: 2, group_id: 1
  UserGroup.create! user_id: 3, group_id: 1
  UserGroup.create! user_id: 4, group_id: 2
  UserGroup.create! user_id: 5, group_id: 3
  UserGroup.create! user_id: 6, group_id: 3
  UserGroup.create! user_id: 7, group_id: 4
  UserGroup.create! user_id: 8, group_id: 4
  UserGroup.create! user_id: 9, group_id: 5
end

def make_neighborhood
  Neighborhood.create! title: 'Kensington Kaleidoscope', description: '#'
  Neighborhood.create! title: 'Ashby Village', description: '#'
end

make_groups
make_users
make_user_groups
make_neighborhood
