class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :kind

  belongs_to :user
  has_many :missing_posts

  scope :spammed, -> { joins("spammers ON missing_post_reports.user_id = spammers.user_id") }
  # def unique_report
  #   if self.class.exists?(:user_id => user_id, :missing_post_id => missing_post_id, :kind => kind)
  #     if(kind == "found")
  #       errors.add :base, :misssing_duplicate_found
  #     end
  #   end
  # end

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
