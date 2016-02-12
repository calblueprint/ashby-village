require "rails_helper"

# create anything you want to reuse that is NOT what you're testing
post_content = "here is some post content"

u1 = User.create! first_name: "Rosie",\
                  last_name: "Rowe",\
                  email: "spec@gmail.com",\
                  phone: "917", cell_phone: "917",\
                  date_of_birth: "date",\
                  password: "okokokokok",\
                  role: 0
p1 = Post.create! user_id: u1.id,\
                  content: post_content,\
                  group_id: 1

RSpec.describe Reply, type: :model do
  it "is valid" do
    r1 = Reply.new(user_id: u1.id, post_id: p1.id, content: post_content)
    expect(r1.save).to eq true
    Reply.where(user_id: u1.id).exist?
  end

  it "is invalid without a user_id" do
    r1 = Reply.new(post_id: p1.id, content: post_content)
    expect(r1.save).to eq false
  end

  it "is invalid without content" do
    r1 = Reply.new(user_id: u1.id, post_id: p1.id)
    expect(r1.save).to eq false
  end

  it "is invalid without post_id" do
    r1 = Reply.new(user_id: u1.id, content: post_content)
    expect(r1.save).to eq false
  end

  # Here is where you put clean up for everything you created at the top
  after(:all) do
    if Rails.env.test?
      u1.destroy
      p1.destroy
    end
  end
end
