class FindingPostsController < ApplicationController
  def index
    @findings = FindingPost.order("created_at desc")
  end

  def show
  end

  def new
   @finding = FindingPost.new
  end

def send_report
  if (current_user)
    @finding = Report.new(finding_report)
    @finding.user = current_user
  if @finding.save
        redirect_to Post.find(@finding.report.post_id), notice: "Your have reported successfully"
      else
        flash[:alert] = @finding.errors.full_messages
        render 'new'
      end
    else
      redirect_to root_url, alert: ["Must be logged in..."]
    end
  end    

  def create
    if (current_user)
    	@finding = FindingPost.new(finding_params)
    	@finding.user = current_user
      if @finding.save
        redirect_to @finding, notice: "Your new post have been created successfully!"
      else
        flash[:alert] = @finding.errors.full_messages
        render 'new'
	    end
    else
      redirect_to root_url, alert: ["Must be logged in..."]
    end
  end

protected
  def finding_params
    params.require(:finding_post).permit(:name,:contact_info,:description,:age,:special_signs,:image,:location,:gender)
  end
 def finding_report
    params.require(:report).permit(:user_id,:post_id,:post_kind)
  end
end