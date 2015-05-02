class Telephone < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :number
  validates :number,
            numericality: { :only_integer => true },
            length: { :is => 11 },
           	format: { :with => /\A01\d\d\d\d\d\d\d\d\d\z/ },
            presence: true
  
  def to_s
    number
  end
end
