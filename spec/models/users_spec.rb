require "rails_helper"

first = "Jenni"
last = "Block"
user_email = "jennifromtheblock@gmail.com"
user_password = "block"
user_password_confirmation = "block"

g = Group.create! name: "Eating food",\
                  description: "Do things together",\
                  kind: "social",\
                  state: "active"

RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(first_name: first, last_name: last, email: user_email,\
                    password: user_password, password_confirmation: user_password_confirmation)
    expect(user.save).to eq true
    expect(user.first_name).to eq first
    expect(user.last_name).to eq last
    expect(user.email).to eq user_email
    expect(user.password).to eq user_password
    expect(user.password_confirmation).to eq user_password_confirmation
  end
  it "is invalid without an email" do
    user = User.new(first_name: first, last_name: last, password: user_password, \
                    password_confirmation: user_password_confirmation)
    expect(user.save).to eq(false)
  end
  it "is invalid without a password" do
    user = User.new(first_name: first, last_name: last, email: user_email, \
                    password_confirmation: user_password_confirmation)
    expect(user.save).to eq(false)
  end
  it "is invalid without a password confirmation" do
    user = User.new(first_name: first, last_name: last, email: user_email, \
                    password: user_password)
    expect(user.save).to eq(false)
  end
  it "is invalid without first name" do
    user = User.new(last_name: last, email: user_email, password: user_password, \
                    password_confirmation: user_password_confirmation)
    expect(user.save).to eq(false)
  end
  it "is invalid without last name" do
    user = User.new(first_name: first, email: user_email, password: user_password, \
                    password_confirmation: user_password_confirmation)
    expect(user.save).to eq(false)
  end
  it "is invalid without first and last name" do
    user = User.new(email: user_email, password: user_password, password_confirmation: user_password_confirmation)
    expect(user.save).to eq(false)
  end
  it "password doesn't match password confirmation" do
    user = User.new(first_name: first, last_name: last, email: user_email, \
                    password: user_password, password_confirmation: "mismatch")
    expect(user.save).to eq false
  end
  it "email format is valid" do
    user = User.new(first_name: first, last_name: last, password: user_password, \
                    password_confirmation: user_password_confirmation)
    addresses = %w(user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn)
    addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end
  it "two users cannot have the same name or email" do
    user1 = User.new(first_name: first, last_name: last, password: user_password, \
                     password_confirmation: user_password_confirmation)
    user2 = user1.dup
    expect(user2.save).to eq false
  end
  it "user is leader" do
    user = User.new(first_name: first, last_name: last, email: user_email, \
                    password: user_password, password_confirmation: user_password_confirmation)
    g.add_user(user, true)
    expect(user.is_leader(g)).to eq true
    expect(user.is_only_leader(g)).to eq true
  end
  it "user is member" do
    user = User.new(first_name: first, last_name: last, email: user_email, \
                    password: user_password, password_confirmation: user_password_confirmation)
    g.add_user(user, false)
    expect(user.is_member(g)).to eq true
  end

  # Here is where you put clean up for everything you created at the top
  after(:all) do
    if Rails.env.test?
      g.destroy
    end
  end
end
