class MissingPostReport < ActiveRecord::Base
  belongs_to :user
  has_many :missing_posts
end