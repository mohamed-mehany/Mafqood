class Location < ActiveRecord::Base
  has_and_belongs_to_many :missing_posts
  has_and_belongs_to_many :finding_posts
  has_and_belongs_to_many :suspect_posts
  
  def to_s
    I18n.locale == :en ? name : name_ar
  end
  
  validates_presence_of :name, :name_ar
end
