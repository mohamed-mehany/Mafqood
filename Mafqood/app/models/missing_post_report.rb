class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :kind

  belongs_to :user
  has_many :missing_posts

  # scope spammed, helps the admin to collect posts of a spammer, so the admin can delete them, By joining user id and spammer id while spammer flag is set to true

  scope :spammed, -> { joins("spammers ON missing_post_reports.user_id = spammers.user_id") }

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
  scope :fake, -> { where("kind = ? OR kind = ?", "Fake", "fake") }
  scope :spam, -> { where("kind = ? OR kind = ?", "Spam", "spam") }
  scope :duplicate, -> { where("kind = ? OR kind = ?", "Duplicate", "duplicate") }
end
