class MissingPostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :report, :edit, :update]

# if no filters are chosen or the query is empty, the page wil redirect with all the indicies,
# otherwise if there is a hit from the sent tag, the page will redirect with the matching indicies.

  def index
    @missing_posts = MissingPost.order("created_at desc")
    @missing_posts = @missing_posts.where("reporter_name LIKE ?", "%" + params[:query] + "%") if params[:query]
    @missing_posts = @missing_posts.where("age - 5 <= ? AND age + 5 >= ?", params[:age], params[:age]) if params[:age] && params[:age] != ""
    @missing_posts = @missing_posts.where("gender = ?", params[:gender]) if params[:gender] && params[:gender] != ""
    @missing_posts = @missing_posts.where("location_id = ?", params[:location]) if params[:location] && params[:location] != ""
    @missing_posts = @missing_posts.where("created_at >= ? AND created_at <= ?", params[:date].to_time - 5.days, params[:date].to_time + 5.days) if params[:date]

  end

  def show
    @missing_post = MissingPost.find(params[:id])
    @ip = session[:ip]
  end

  def new
    @missing_post = MissingPost.new
  end

  def create
    @missing_post = MissingPost.new(missing_post_params)
    @missing_post.user = current_user
    if @missing_post.save
      save_action
      redirect_to({ action: "index"}, notice: ["Your Post has been created successfully"])
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
      save_action
      redirect_to({ action: "index"}, notice: t("missing_posts.successful_report_found"))
    else
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
