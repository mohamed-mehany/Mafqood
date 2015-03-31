class FindingPostReport < ActiveRecord::Base
  
  belongs_to :user
  validate :unique_report

  def unique_report
    if self.class.exists?(:user_id => user_id, :finding_post_id => finding_post_id, :kind => kind)
      if(kind == "mine" || kind == "spam")
        errors.add :base, "You have already reported this kid as yours!"
      end
    end
  end
end