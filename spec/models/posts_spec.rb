require "rails_helper"

# create anything you want to reuse that is NOT what you're testing
post_content = "here is some post content"
u1 = User.create! first_name: "Rosie",\
                  last_name: "Rowe",\
                  email: "blah@gmail.com",\
                  phone: "917", cell_phone: "917",\
                  date_of_birth: "date",\
                  password: "okokokokok",\
                  role: 0

RSpec.describe Post, type: :model do
  it "is valid" do
    p1 = Post.new(user_id: u1.id, content: post_content)
    expect(p1.save).to eq true
    expect(p1.content).to eq post_content
  end
  it "is invalid without an id" do
    p1 = Post.new(content: post_content)
    expect(p1.save).to eq(false)
  end
  it "is invalid without content" do
    p1 = Post.new(user_id: u1.id)
    expect(p1.save).to eq(false)
  end
  it "is invalid without a group" do
    p1 = Post.new(user_id: u1.id, content: post_content)
    expect(p1.save).to eq true
    expect(p1.group_id).to exist
  end
  it "is ordered by most recent first"

  # Here is where you put clean up for everything you created at the top
  after(:all) do
    if Rails.env.test?
      u1.destroy
    end
  end
end