# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8

def make_groups
  Group.create! name: 'Movies', text: 'yo'
  Group.create! name: 'Knitting', text: 'yo'
  Group.create! name: 'Computer', text: 'yo'
  Group.create! name: 'Poker', text: 'yo'
  Group.create! name: 'Bingo', text: 'yo'
  Group.create! name: 'Music', text: 'yo'
  Group.create! name: 'Reading', text: 'yo'
  Group.create! name: 'Politics', text: 'yo'
  Group.create! name: 'Education', text: 'yo'
  Group.create! name: 'Kites', text: 'yo'
  Group.create! name: 'Pool', text: 'yo'
  Group.create! name: 'Checkers', text: 'yo'
  Group.create! name: 'Chess', text: 'yo'
  Group.create! name: 'Frisbee', text: 'yo'
  Group.create! name: 'Travel', text: 'yo'
  Group.create! name: 'Television', text: 'yo'
end

make_groups