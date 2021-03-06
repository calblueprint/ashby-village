# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

def make_groups
  # Group.create! name: 'Cultural Events', description: 'yo', neighborhood_id: 1, kind: 1, photo: seed_image("jazzercise.jpg"), state: 1
  Group.create! name: 'Knitting', description: 'yo', neighborhood: 1, photo: seed_image("gaming.jpg"), state: 1
  Group.create! name: 'Cultural Events', description: 'Explore culture with ya homies', neighborhood: 1, photo: seed_image("film_fanatics.jpg"), state: 1
  Group.create! name: 'Poker', description: 'yo', neighborhood: 1, photo: seed_image("skydiving.jpg"), state: 1
  Group.create! name: 'Nature Walks', description: 'yo', neighborhood: 1, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Music', description: 'yo', neighborhood_id: 1, kind: 1, photo: seed_image("gaming.jpg"), state: 1
  # Group.create! name: 'Reading', description: 'yo', neighborhood_id: 1, kind: 0, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Politics', description: 'yo', neighborhood_id: 2, kind: 1, photo: seed_image("skydiving.jpg"), state: 1
  # Group.create! name: 'Education', description: 'yo', neighborhood_id: 2, kind: 0, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Kites', description: 'yo', neighborhood_id: 2, kind: 0, photo: seed_image("gaming.jpg"), state: 1
  # Group.create! name: 'Pool', description: 'yo', neighborhood_id: 2, kind: 1, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Checkers', description: 'yo', neighborhood_id: 2, kind: 1, photo: seed_image("skydiving.jpg"), state: 1
  # Group.create! name: 'Chess', description: 'yo', neighborhood_id: 3, kind: 0, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Frisbee', description: 'yo', neighborhood_id: 3, kind: 1, photo: seed_image("gaming.jpg"), state: 1
  Group.create! name: 'Travel', description: 'yo', neighborhood: 3, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Television', description: 'yo', neighborhood_id: 3, kind: 0, photo: seed_image("skydiving.jpg"), state: 1
  # Group.create! name: 'Ashby Village Announcements', description: 'yo', neighborhood_id: 2, kind: 2, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Emeryville  Announcements', description: 'yo', neighborhood_id: 5, kind: 2, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Midlandish Announcements', description: 'yo', neighborhood_id: 6, kind: 2, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'North Berkeley Hills Announcements', description: 'yo', neighborhood_id: 7, kind: 2, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Thousand Oaks Hamlet Announcements', description: 'yo', neighborhood_id: 4, kind: 2, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Outlandish Announcements', description: 'yo', neighborhood_id: 3, kind: 2, photo: seed_image("film_fanatics.jpg"), state: 1
  # Group.create! name: 'Kensignton Kaleidoscope Announcements', description: 'yo', neighborhood_id: 1, kind: 2, photo: seed_image("jazzercise.jpg"), state: 1
  # Group.create! name: 'Claremont-Elmwood Announcements', description: 'yo', neighborhood_id: 8, kind: 2, photo: seed_image("film_fanatics.jpg"), state: 1
end

def make_users
  User.create! first_name: 'Rosie', last_name: 'Rowe', email: 'blah@gmail.com', phone: '9171038903', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("nikita.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Johnny', last_name: 'Rowe', email: 'blah1@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("andy.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Susie', last_name: 'Rowe', email: 'blah2@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("shannon.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Susan', last_name: 'Rowe', email: 'blah3@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("helen.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Maria', last_name: 'Rowe', email: 'blah4@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("andy.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Eric', last_name: 'Rowe', email: 'blah5@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("daniel.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Dennis', last_name: 'Rowe', email: 'blah6@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("andy.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Ajay', last_name: 'Rowe', email: 'blah7@gmail.com', phone: '9171111111', password: 'okokokokok', password_confirmation: 'okokokokok', photo: seed_image("daniel.jpg"), role: 0, confirmed_at: Time.now
  User.create! first_name: 'Walter', last_name: 'Park', email: 'admin@gmail.com', phone: '5015551234', password:'123', password_confirmation: '123', photo: seed_image("daniel.jpg"), role: 1, confirmed_at: Time.now
end

def make_user_groups
  UserGroup.create! user_id: 1, group_id: 1, is_leader: false
  UserGroup.create! user_id: 1, group_id: 2, is_leader: false
  UserGroup.create! user_id: 1, group_id: 3, is_leader: false
  UserGroup.create! user_id: 1, group_id: 4, is_leader: false
  UserGroup.create! user_id: 1, group_id: 5, is_leader: false
  UserGroup.create! user_id: 1, group_id: 6, is_leader: false
  UserGroup.create! user_id: 1, group_id: 7, is_leader: false
  UserGroup.create! user_id: 1, group_id: 8, is_leader: false
  UserGroup.create! user_id: 1, group_id: 9, is_leader: false
  UserGroup.create! user_id: 1, group_id: 10, is_leader: false
  UserGroup.create! user_id: 1, group_id: 11, is_leader: false
  UserGroup.create! user_id: 1, group_id: 12, is_leader: false
  UserGroup.create! user_id: 1, group_id: 13, is_leader: false
  UserGroup.create! user_id: 1, group_id: 14, is_leader: false
  UserGroup.create! user_id: 1, group_id: 15, is_leader: false
  UserGroup.create! user_id: 1, group_id: 16, is_leader: false
  UserGroup.create! user_id: 1, group_id: 4, is_leader: false
  UserGroup.create! user_id: 1, group_id: 5, is_leader: false
  UserGroup.create! user_id: 1, group_id: 6, is_leader: false
  UserGroup.create! user_id: 2, group_id: 1, is_leader: false
  UserGroup.create! user_id: 3, group_id: 1, is_leader: false
  UserGroup.create! user_id: 4, group_id: 1, is_leader: false
  UserGroup.create! user_id: 5, group_id: 1, is_leader: false
  UserGroup.create! user_id: 6, group_id: 1, is_leader: false
  UserGroup.create! user_id: 7, group_id: 1, is_leader: false
  UserGroup.create! user_id: 8, group_id: 1, is_leader: false
  UserGroup.create! user_id: 9, group_id: 1, is_leader: false
end

def make_posts
  users = User.order(:created_at).take(6)
  50.times do
    title = "PSA!!!!"
    content = "I am soooooooooooo"
    users.each { |user| user.posts.create!(title: title, content: content, group: Group.first) }
  end
end

make_groups
make_users
# make_user_groups
make_posts
