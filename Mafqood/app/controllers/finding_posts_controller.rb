class FindingPostsController < ApplicationController
  before_filter :auth, only: [:create, :new, :mine]
  
  def index
    @finding_posts = FindingPost.order("created_at desc")
  end

  def show
  end

  def new
   @finding_post = FindingPost.new
  end

  def create
    @finding_post = FindingPost.new(finding_post_params)
    @finding_post.user = current_user
    if @finding_post.save
      redirect_to({ action: "index"}, notice: "Your new post have been created successfully!")
    else
      flash[:alert] = @finding_post.errors.full_messages
      render "new"
    end
  end

# Public: Report this finding post as mine i.e this kid is my kid.
#       
# Examples
#
#   mine #i.e this method is called when a user navigates to 
#   /fining_posts/:id/mine 
#
#   # => @finding_post_report.save
#
# Redirects the user to the findings post index and displays a flash 
# whether the report wa successful or not.
  def mine
    @temp = FindingPost.find(params[:id])
    @finding_post_report = FindingPostReport.new
    @finding_post_report.finding_post_id = @temp.id
    @finding_post_report.user = current_user
    @finding_post_report.kind = "mine"
    if @finding_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully report this child as yours")
    else
      flash[:alert] = @finding_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

protected
  def finding_post_params
    params.require(:finding_post).permit(
      :name,:contact_info,:description,:age,:special_signs,
      :image,:location,:gender)
  end
# Protected: Redirects the user to the homepage unless he is logged in
  def auth
    redirect_to(root_url, alert: ["Must be logged in..."]) unless current_user
  end
end
