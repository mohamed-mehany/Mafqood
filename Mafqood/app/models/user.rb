class User < ActiveRecord::Base
  has_many :accounts
  validates_presence_of :name, :email
end
