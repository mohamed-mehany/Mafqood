class MissingPostReport < ActiveRecord::Base
  belongs_to :user
  has_many :missing_posts
  validate :unique_report
def unique_report
    if self.class.exists?(:user_id => user_id, :missing_post_id => missing_post_id, :type=> type)
      # if(kind == "mine")
      #   errors.add :base, "You have already reported this kid as yours!"
      # end
    if(type == "spam")
        errors.add :base, "You have already reported this!"
       end
        if(type == "fake")
        errors.add :base, "You have already reported this!"
        end
        if(type == "duplicate")
        errors.add :base, "You have already reported this!"
    end
    end
  end
end
