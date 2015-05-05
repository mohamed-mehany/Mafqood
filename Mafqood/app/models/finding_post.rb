class FindingPost < ActiveRecord::Base
  belongs_to :user
  has_one :location
  
  # scope spammed, helps the admin to collect posts of a spammer, so the admin can delete them, By joining user id and spammer id while spammer flag is set to true

  scope :spammed, -> { joins("INNER JOIN spammers ON finding_posts.user_id = spammers.user_id") }

  validates_presence_of :name, :description, :image, :age, :location_id, :gender

  validates_inclusion_of :age, in: 0..140 

  mount_uploader :image, ImageUploader

  def to_s
    name
  end
end
