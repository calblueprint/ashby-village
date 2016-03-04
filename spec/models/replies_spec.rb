require "rails_helper"

RSpec.describe Reply, type: :model do
  before do
    @post_content = "here is some post content"

    @u1 = User.create first_name: "Rosie",\
                      last_name: "Rowe",\
                      email: "spec@gmail.com",\
                      password: "okokokokok",\
                      password_confirmation: "okokokokok",\
                      role: 0
    @u1 = User.find_by(email: "spec@gmail.com")
    @p1 = Post.create user_id: @u1.id,\
                      content: @post_content,\
                      group_id: 1
    @p1 = Post.find_by(user_id: @u1.id)
  end

  it "is valid" do
    r1 = Reply.new(user_id: @u1.id, post_id: @p1.id, content: @post_content)
    expect(r1.save).to eq true
    expect(Reply.find_by(user_id: @u1.id).content).to eq @post_content
  end

  it "is invalid without a user_id" do
    r1 = Reply.new(post_id: @p1.id, content: @post_content)
    expect(r1.save).to eq false
  end

  it "is invalid without content" do
    r1 = Reply.new(user_id: @u1.id, post_id: @p1.id)
    expect(r1.save).to eq false
  end

  it "is invalid without post_id" do
    r1 = Reply.new(user_id: @u1.id, content: @post_content)
    expect(r1.save).to eq false
  end

end
