class Group < ActiveRecord::Base
  enum kind: [:Social, :Neighborhood, :Committee]

  extend FriendlyId
  friendly_id :name, :use => :slugged

	belongs_to :neighborhood

	has_many :user_groups
	has_many :users, through: :user_groups

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
