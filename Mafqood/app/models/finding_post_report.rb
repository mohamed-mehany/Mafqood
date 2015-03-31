class FindingPostReport < ActiveRecord::Base
  
  belongs_to :user
  validate :unique_report

  
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
    if self.class.exists?(:user_id => user_id, :finding_post_id => finding_post_id, :kind => kind)
      if(kind == "mine" || kind == "spam")
        errors.add :base, "You have already reported this kid as yours!"
      end
    end
  end
end