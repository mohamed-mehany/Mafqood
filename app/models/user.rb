class User < ActiveRecord::Base
  has_many :accounts
  has_many :telephones
  has_many :addresses
  has_many :finding_post
  has_many :missing_post

  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates_presence_of :name, :email

  def to_s
    name
  end
end
