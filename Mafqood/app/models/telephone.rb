class Telephone < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :number
  
  def to_s
    number
  end
end
