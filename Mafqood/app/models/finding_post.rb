class FindingPost < ActiveRecord::Base
  
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :user
  has_one :location
  
  validates_presence_of :name, :description, :image, :age, :location, :contact_info
  validates_inclusion_of :gender, in: [true, false]
  validates_inclusion_of :age, in: 0..140 
  validates :contact_info,
            numericality: { only_integer: true }, 
            length: { is: 11 }	

  mount_uploader :image, ImageUploader

  def to_s
    name
  end
end
