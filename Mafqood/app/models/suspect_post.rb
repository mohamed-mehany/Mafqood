class SuspectPost < ActiveRecord::Base
  attr_accessor :image
  mount_uploader :image, ImageUploader

  validates :gender, presence: :true
  validates :approximate_age, :location, :image, :reporter_phone, presence: :true          
  validates :reporter_phone, 
            :numericality => { :only_integer => true }, 
            :length => { :is => 11 },
            :format => { :with => /\A01\d\d\d\d\d\d\d\d\d\z/ }
  validates :description, :special_signs,
            :length => { :maximum => 500 } 

  #validates :description, :special_signs, length: { maximum: 500, 
  #  too_long: "%{count} characters is the maximum allowed"}
  #validates :reporter_phone, length: { is: 11 }
  #validates :reporter_phone, numericality: { only_integer: true }
  #validates :reporter_phone, format: { with: /\A01\d\d\d\d\d\d\d\d\d\z/ }
  #validates :approximate_age, :gender, :location, :image, :reporter_phone, presence: true
end