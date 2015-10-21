# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8

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
