class FindingPostsController < ApplicationController
  before_filter :auth, only: [:create, :new, :mine]
  before_filter(only: [:edit,:update]) { |f| f.is_owner( params[:id] )}
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
      redirect_to({ action: "index"}, notice: t("finding.successful_create"))
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
# whether the report was successful or not.
  def mine
    @temp = FindingPost.find(params[:id])
    @finding_post_report = FindingPostReport.new
    @finding_post_report.finding_post_id = @temp.id
    @finding_post_report.user = current_user
    @finding_post_report.kind = "mine"
    if @finding_post_report.save
      redirect_to({ action: "index"}, notice: t("finding.successful_report_mine"))
    else
      flash[:alert] = @finding_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end
 
  def edit
    @finding_post = FindingPost.find(params[:id])
  end

  def update
    @finding_post = FindingPost.find(params[:id])
    if @finding_post.update(finding_post_params.reject{|k,v| v.blank?})
      redirect_to({action: "index"}, notice: "t(finding.successful_edit")
    else
      flash[:alert] = @finding_post_report.errors.full_messages
      render "edit"
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
    redirect_to(root_url, alert: [t("finding.must_login")]) unless current_user
  end
# Public: Checks if the current user using the website is the post's owner 
# whenever edit and update methods are called as this is used in a before
# filter
#
# @user_id  - The user_id to be compared with the user_id of the post.
# 
# Examples:
#   A user with id 1 navigates to finding_posts/1/edit who's user_id = 1
#   # => true
#
#   A user with id 1 navigates to finding_posts/5/edit who's user_id = 2
#   # => false
#
# Returns either true if the passed @user_id equals the user_id of the post
# otherwise returns false.
  def is_owner user_id
    if (current_user == nil || (current_user.id != FindingPost.find(params[:id]).user_id))
      redirect_to({action: "index"}, alert: [t("finding.edit_login")])
    end            
  end
end