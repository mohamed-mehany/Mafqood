class MissingPost < ActiveRecord::Base

  # attr_accessor :image
  # mount_uploader :image, ImageUploader
  # belongs_to :user
  # validates :gender , presence: true
  # validates :image , presence: true
  # validates :age , presence: true
  # validates :location , presence: true
  # validates :reporter_name , presence: true
  # validates :reporter_phone , presence: true
  # validates :description, :special_signs,
  #           :length => { :maximum => 500 }
  # validates :reporter_phone,
  #           :numericality => { :only_integer => true },
  #           :length => { :is => 11 },
  #           :format => { :with => /\A01\d\d\d\d\d\d\d\d\d\z/ }
  belongs_to :user
  validates_presence_of :reporter_name,:description,:image,:age,:location,:gender,:reporter_phone
  validates_inclusion_of :age, :in => 0..140
  validates :reporter_phone,
                :numericality => { :only_integer => true },
                :length => { :is => 11 }
  mount_uploader :image, ImageUploader
end
