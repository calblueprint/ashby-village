require "rails_helper"

RSpec.describe Post, type: :model do
  before do
    @u1 = User.create first_name: "Rspec first name",\
                      last_name: "Rspec last name",\
                      email: "rspec@gmail.com",\
                      password: "rspecpassword",\
                      password_confirmation: "rspecpassword",\
                      role: 0
    @u1 = User.find_by(email: "rspec@gmail.com")
    @g1 = Group.create name: "Rspec Group",\
                       description: "Rspec Description",\
                       neighborhood: 1,\
                       state: 1
    @g1 = Group.find_by(name: "Rspec Group")
    @post_content = "rspec post content"
  end
  it "is valid" do
    p1 = Post.new(user_id: @u1.id, content: @post_content, group_id: @g1.id)
    expect(p1.save).to eq true
    expect(Post.find_by(id: p1.id).content).to eq @post_content
    expect(p1.content).to eq @post_content
  end
  it "is invalid without an id" do
    p1 = Post.new(content: @post_content, group_id: @g1.id)
    expect(p1.save).to eq false
  end
  it "is invalid without content" do
    p1 = Post.new(user_id: @u1.id, group_id: @g1.id)
    expect(p1.save).to eq false
  end

end
