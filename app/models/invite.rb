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

class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
