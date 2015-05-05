class MissingPost < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessor :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_one :location
  
  validates :gender , presence: true
  validates :image , presence: true
  validates :age , presence: true
  validates :location , presence: true
  validates :reporter_name , presence: true
  validates :reporter_phone , presence: true
  validates :description, :special_signs,
            :length => { :maximum => 500 }
  validates :reporter_phone,
            :numericality => { :only_integer => true },
            :length => { :is => 11 },
            :format => { :with => /\A01\d\d\d\d\d\d\d\d\d\z/ }

end
MissingPost.import