class Group < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, :use => :slugged

  enum kind: [:social, :neighborhood, :committee]

  belongs_to :neighborhood

  has_many :users_groups
  has_many :users, through: :users_groups

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
