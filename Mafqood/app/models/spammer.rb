class Spammer < ActiveRecord::Base
  validates :user_ip , presence: true
  validates :kind , presence: true
end
