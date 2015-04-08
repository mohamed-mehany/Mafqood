class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :kind

  belongs_to :user
  has_many :missing_posts

  # Author: Nariman Hesham
  #
  # Creating three scopes for the different types of reports
  #
  # Examples:
  # => calling MissingPostReport.fake returns all missing posts
  #    reported as Fake
  # => calling MissingPostReport.spam returns all missing posts
  #    reported as Spam
  # => calling MissingPostReport.duplicate returns all missing posts
  #    reported as Duplicate
  scope :fake, -> { where(kind: "Fake", kind: "fake") }
  scope :spam, -> { where(kind: "Spam", kind: "spam") }
  scope :duplicate, -> { where(kind: "Duplicate", kind: "duplicate") }
end
