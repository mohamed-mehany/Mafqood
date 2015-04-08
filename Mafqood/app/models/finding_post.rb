class FindingPost < ActiveRecord::Base
 
# include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks

#   settings index: { number_of_shards: 1 }



  def as_indexed_json(options = {})
    self.as_json({only: [:name, :description, :age, :location, :gender]})
  end
	belongs_to :user
	validates_presence_of :name,:description,:image,:age,:location,:gender,:contact_info
	validates_inclusion_of :age, :in => 0..140
  	validates :contact_info, 
            	  :numericality => { :only_integer => true }, 
            	  :length => { :is => 11 }	
	mount_uploader :image, ImageUploader
end
