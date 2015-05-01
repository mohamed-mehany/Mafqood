class SuspectPostReport < ActiveRecord::Base
  has_many :suspect_posts
  
  # Author: Nariman Hesham
  #
  # Creating three scopes for the different types of reports
  #
  # Examples:
  # => calling SuspectPostReport.fake returns all suspect posts
  #    reported as Fake
  # => calling SuspectPostReport.spam returns all suspect posts
  #    reported as Spam
  # => calling SuspectPostReport.duplicate returns all suspect posts
  #    reported as Duplicate    
  scope :fake, -> { where(kind: "Fake", kind: "fake") }
  scope :spam, -> { where(kind: "Spam", kind: "spam") }
  scope :duplicate, -> { where(kind: "Duplicate", kind: "duplicate") }
end
