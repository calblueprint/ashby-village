# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  rsvp       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  organizer  :boolean          default(FALSE)
#

require "rails_helper"

RSpec.describe Invite, type: :model do
  before do
    @u1 = User.create first_name: "Rspec first name",\
                      last_name: "Rspec last name",\
                      email: "rspec@gmail.com",\
                      password: "rspecpassword",\
                      password_confirmation: "rspecpassword",\
                      role: 0
    @u1 = User.find_by(email: "rspec@gmail.com")
    @e1 = Event.create(title: "Test Event",
                       group_id: @g1,
                       description: "This is a super cool test event where people should come and yay!",
                       location: "Berkeley, CA",
                       starttime: "2:00pm",
                       endtime: "3:00pm",
                       startdate: "1-5-16",
                       enddate: "1-5-16")
    @e1 = Event.find_by(title: "Test Event")
  end
  it "is valid" do
    i = Invite.new(event_id: @e1.id, user_id: @u1.id)
    expect(i.valid?).to eq true
    expect(i.rsvp).to eq false
  end
end
