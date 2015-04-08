class SuspectPost < ActiveRecord::Base
# include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks

#   settings index: { number_of_shards: 1 }

#   def as_indexed_json(options = {})
#     self.as_json({only: [:name, :description, :age, :location, :gender]})
#   end

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
end