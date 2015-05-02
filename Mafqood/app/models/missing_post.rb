class MissingPost < ActiveRecord::Base
  attr_accessor :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_one :location
  
  scope :spammed, -> { joins("INNER JOIN spammers ON missing_posts.user_id = spammers.user_id") }

  validates :gender, presence: true
  validates :image , presence: true
  validates :age , presence: true

  validates :location_id , presence: true
  validates :reporter_name , presence: true
  validates :description, :special_signs,
            :length => { :maximum => 500 }
end
