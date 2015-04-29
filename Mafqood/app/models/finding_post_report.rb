class FindingPostReport < ActiveRecord::Base
  
  belongs_to :user
  #validate :unique_report
  validates :user_id, uniqueness: { scope: [:finding_post_id,:kind] }
  has_many :finding_posts

  scope :spammed, -> { joins("spammer ON finding_posts.user_id = spammers.user_id") }

  # Author: Nariman Hesham
  #
  # Creating three scopes for the different types of reports
  #
  # Examples:
  # => calling FindingPostReport.fake returns all finding posts
  #    reported as Fake
  # => calling FindingPostReport.spam returns all finding posts
  #    reported as Spam
  # => calling FindingPostReport.duplicate returns all finding posts
  #    reported as Duplicate 
  scope :fake, -> { where(kind: "Fake", kind: "fake") }
  scope :spam, -> { where(kind: "Spam", kind: "spam") }
  scope :duplicate, -> { where(kind: "Duplicate", kind: "duplicate") }


# Private: As a uniquness validations, this method checks if there is a 
# FindingPostReport with the combination of the user_id, finding_post_id
# -the post being reported- and kind which is the type of report
#
# Examples
#
#   mine #i.e this method is called when a user navigates to 
#   /fining_posts/:id/mine 
#
#   # => @finding_post_report.save
#   
#   In the previous example, the controller invokes the model when
#   mine is called, whic executes unique_report
#
# If there is an existing record with the specified parameters 
# a specific error message is added to :base to the errors of
# the record  
  def unique_report
    if FindingPostReport.exists?(:user_id => user_id, :finding_post_id => finding_post_id, :kind => kind)
      if(kind == "mine")
        errors.add :base, :finding_duplicate_mine
      end
    end
  end
end
