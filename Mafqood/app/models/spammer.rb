class Spammer < ActiveRecord::Base
  has_one :user
  validates :user_ip , presence: true
  validates :kind , presence: true
  validates :user_ip, uniqueness: true
end
