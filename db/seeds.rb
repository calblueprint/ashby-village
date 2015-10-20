# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
group_list = [
  [ "Group1" ],
  [ "Group2" ],
  [ "Group3" ],
  [ "Group4" ]
]

group_list.each do |name|
  Group.create( name: name)
end