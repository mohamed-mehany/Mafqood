class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :type

  belongs_to :user
  has_many :missing_posts
end
