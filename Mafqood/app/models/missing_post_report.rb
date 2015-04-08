class MissingPostReport < ActiveRecord::Base

  validates_presence_of :user_id,:missing_post_id, :kind

  belongs_to :user
  has_many :missing_posts

  def unique_report
    if self.class.exists?(:user_id => user_id, :missing_post_id => missing_post_id, :kind => kind)
      if(kind == "found")
        errors.add :base, :misssing_duplicate_found
      end
    end
  end

end
