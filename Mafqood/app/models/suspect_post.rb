class SuspectPost < ActiveRecord::Base
  attr_accessor :image
  mount_uploader :image, ImageUploader
  has_one :location
  
  scope :spammed, -> { joins("INNER JOIN spammers ON ip = spammers.user_ip") }
  
  validates :location_id, presence: true
  validates :gender, presence: :true
  validates :approximate_age, :image, :reporter_name, :reporter_phone, presence: true          
  validates :reporter_phone, 
            :numericality => { :only_integer => true }, 
            :length => { :is => 11 },
            :format => { :with => /\A01\d\d\d\d\d\d\d\d\d\z/ }
  validates :description, :special_signs,
            :length => { :maximum => 500 } 
end
