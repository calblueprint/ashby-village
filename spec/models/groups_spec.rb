require "rails_helper"

# reusable info

RSpec.describe Group, type: :model do
  before do
    @group_name = "Knitting Group"
    @group_desc = "Knit with friends!"
    @group_state = "active"
    @leader1 = User.create first_name: "Rosie",\
                           last_name: "Rowe",\
                           email: "jump2@gmail.com",\
                           password: "okokokokok",\
                           password_confirmation: "okokokokok",\
                           role: 0
    @leader1 = User.find_by(email: "jump2@gmail.com")
    @leader2 = User.create first_name: "Mark",\
                           last_name: "Rowe",\
                           email: "hi2@gmail.com",\
                           password: "okokokokok",\
                           password_confirmation: "okokokokok",\
                           role: 0
    @leader2 = User.find_by(email: "hi2@gmail.com")
  end
  it "is valid" do
    g1 = Group.new(name: @group_name, description: @group_desc, state: @group_state)
    expect(g1.save).to eq true
    expect(g1.name).to eq @group_name
    expect(g1.description).to eq @group_desc
    expect(g1.state).to eq @group_state
  end
  it "is invalid without name" do
    g1 = Group.new(description: @group_desc, state: @group_state)
    expect(g1.save).to eq(false)
  end
  it "is invalid without description" do
    g1 = Group.new(name: @group_name, state: @group_state)
    expect(g1.save).to eq(false)
  end
  it "has leader" do
    g1 = Group.new(name: @group_name, description: @group_desc, state: @group_state)
    g1.add_user(@leader1, make_leader = true)
    expect(g1.save).to eq true
    expect(g1.has_one_leader).to eq true
  end

  it "has no leader" do
    g1 = Group.new(name: @group_name, description: @group_desc, state: @group_state)
    g1.add_user(@leader1, make_leader = true)
    expect(g1.save).to eq true
    g1.remove_user(@leader1)
    expect(g1.has_one_leader).to eq false
    expect(g1.state).to eq("inactive")
  end

  it "has two leaders" do
    g1 = Group.new(name: @group_name, description: @group_desc, state: @group_state)
    g1.add_user(@leader1, make_leader = true)
    g1.add_user(@leader2, make_leader = true)
    expect(g1.save).to eq true
    expect(g1.has_one_leader).to eq(false)
  end

  it "has one leader after deleting leader" do
    g1 = Group.new(name: @group_name, description: @group_desc, state: @group_state)
    g1.add_user(@leader1, make_leader = true)
    g1.add_user(@leader2, make_leader = true)
    g1.remove_user(@leader2)
    expect(g1.save).to eq true
    expect(g1.has_one_leader).to eq true
  end

end
