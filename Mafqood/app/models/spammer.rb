class Spammer < ActiveRecord::Base
  validates :user_ip , presence: true
  validates :kind , presence: true
  validates :user_ip, uniqueness: true
end
