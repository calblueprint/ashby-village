# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8
group_list = [
  [ "Knitting", 11111 ],
  [ "Computer Classes", 22222 ],
  [ "Poker", 33333 ],
  [ "Bingo", 44444 ],
  [ "Music", 55555 ],
  [ "Reading Circle", 66666 ],
  [ "Politics", 77777 ],
  [ "Education", 88888 ]
]

group_list.each do |name, id|
  Group.create( name: name, id: id)
end

# def make_groups
#   Group.create! name: 'A'
#   Group.create! name: 'B'
#   Group.create! name: 'C'
#   Group.create! name: 'D'
#   Group.create! name: 'E'
#   Group.create! name: 'F'
#   Group.create! name: 'G'
#   Group.create! name: 'H'
#   Group.create! name: 'I'
#   Group.create! name: 'J'
#   Group.create! name: 'K'
#   Group.create! name: 'L'
#   Group.create! name: 'M'
#   Group.create! name: 'N'
#   Group.create! name: 'O'
#   Group.create! name: 'P'
# end

# make_groups