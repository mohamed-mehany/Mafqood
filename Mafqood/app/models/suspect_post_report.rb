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

def unique_report
    if self.class.exists?(:user_id => user_id, :missing_post_id => missing_post_id, :kind => kind)
      if(kind == "mine")
        errors.add :base, "You have already reported this kid as yours!"
      end
    if(kind == "spam")
        errors.add :base, "You have already reported this!"
       end
        if(kind == "fake")
        errors.add :base, "You have already reported this!"
        end
        if(kind == "duplicate")
        errors.add :base, "You have already reported this!"
    end
    end
  end
end
