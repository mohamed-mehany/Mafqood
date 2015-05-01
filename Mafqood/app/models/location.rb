class Location < ActiveRecord::Base
  has_and_belongs_to_many :missing_post
  has_and_belongs_to_many :finding_post
  has_and_belongs_to_many :suspect_post
end
