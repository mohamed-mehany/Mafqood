class MissingPostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :report, :edit , :update]

  def index
    @missing_posts = MissingPost.new
    @missing_posts = MissingPost.order("created_at desc")
  end

  def show
    @missing_post = MissingPost.find(params[:id])
  end

  def new
    @missing_post = MissingPost.new
  end

  def create
    @missing_post = MissingPost.new(missing_post_params)
    @missing_post.user = current_user
    if @missing_post.save
      redirect_to({ action: "index"}, notice: t("suspect_posts.successful_create"))
    else
      render 'new'
    end
  end

  # Author: Nariman Hesham
  #
  # public: Report a specific missing post to be found by child's
  #   parents or the contrary
  #
  # method is called when a user is navigated to '/my_posts/:id/found'
  #
  # @missing_post.save
  # => true, redirects the user to user posts and success message is displayed
  # => false, redirects the user to user posts and error message is displayed
  def report_found
    @missing_post = MissingPost.find(params[:id])
    @missing_post.status == true ? @missing_post.status = 0 : @missing_post.status = 1
    if @missing_post.save
      flash[:notice] = "Your Post status has been updated successfully"
      redirect_to my_posts_path
    else
      redirect_to my_posts_path, alert: ["Error while updating post status"]
    end
  end

# to edit post getting the user id and matching it with the current user
# if equal render to new to edit the post else prints alert message

  def edit
    @missing = MissingPost.find(params[:id])
    if current_user == @missing.user
      @missing_post = @missing
      render 'new'
    else
      redirect_to({ action: "index"}, alert: t("missing_posts.unauthorized_edit"))
    end
  end

  def update
    @missing = MissingPost.find(params[:id])
    if @missing.update(missing_post_params)
      redirect_to({ action: "index"}, notice: t("missing_posts.successful_post"))
    else
      render 'new'
    end
  end

# Examples
#
#   report #i.e this method is called when a user navigates to
#   /missing_posts/:id/mine
#
#   # => @missing_post_report.save
#
# Redirects the user to the missings post index and displays a flash
# whether the report was successful or not.

  def report
    @missing_post = MissingPost.find(params[:id])
    @report_found = MissingPostReport.new
    @report_found.kind = "found"
    @report_found.user_id = current_user.id
    @report_found.missing_post_id = @missing_post.id
    if @missing_post.user_id == current_user.id
      @report_found.save
      redirect_to({ action: "index"}, notice: t("missing_posts.successful_report_mine"))
    else
      flash[:alert] = @report_found.errors.full_messages
      redirect_to action: "index"
    end
  end

  protected
 # Protected: Redirects the user to the homepage unless he is logged in

  def missing_post_params
    params.require(:missing_post).permit(:age, :location_id, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
  end

  def auth
    redirect_to(root_url, alert: ["Must be logged in..."]) unless current_user
  end

end
