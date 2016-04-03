# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  starttime   :time
#  endtime     :time
#  startdate   :date
#  enddate     :date
#  group_id    :integer
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Event < ActiveRecord::Base

  belongs_to :group

  has_many :invites
  has_many :users, through: :invites do
    def rsvps
      where("invites.rsvp = ?", true)
    end
    def organizers
      where("invites.organizer = ?", true)
    end
  end

end
