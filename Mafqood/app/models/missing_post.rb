# require 'elasticsearch/model'

class MissingPost < ActiveRecord::Base
 
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
 
  # settings index: { number_of_shards: 1 }

  def as_indexed_json(options = {})
    self.as_json({only: [:reporter_phone, :reporter_name, :user, :description, :age, :location, :gender]})
  end
  
  attr_accessor :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :gender , presence: true
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