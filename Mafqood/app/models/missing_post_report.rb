class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :kind

  belongs_to :user
  has_many :missing_posts

  scope :fake, -> { where(kind: "Fake", kind: "fake") }
  scope :spam, -> { where(kind: "Spam", kind: "spam") }
  scope :duplicate, -> { where(kind: "Duplicate", kind: "duplicate") }
end
