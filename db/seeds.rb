# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8

def make_groups
  Group.create! name: 'Movies'
  Group.create! name: 'Knitting'
  Group.create! name: 'Computer'
  Group.create! name: 'Poker'
  Group.create! name: 'Bingo'
  Group.create! name: 'Music'
  Group.create! name: 'Reading'
  Group.create! name: 'Politics'
  Group.create! name: 'Education'
  Group.create! name: 'Kites'
  Group.create! name: 'Pool'
  Group.create! name: 'Checkers'
  Group.create! name: 'Chess'
  Group.create! name: 'Frisbee'
  Group.create! name: 'Travel'
  Group.create! name: 'Television'
end

make_groups