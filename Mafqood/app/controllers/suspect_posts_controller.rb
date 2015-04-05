class SuspectPostsController < ApplicationController
  def index
    @suspects = SuspectPost.order("created_at desc")
  end

  def show
  end

  def new
    @suspect_post = SuspectPost.new
  end

  def report1_suspect
    @temp = MissingPost.find(params[:id])
    @suspect_post_report = SuspectPostReport.new
    @suspect_post_report.suspect_post_id = @temp.id
    @suspect_post_report.user = current_user
    @suspect_post_report.kind = "spam"
    if @suspect_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @suspect_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  def report2_suspect
    @temp = MissingPost.find(params[:id])
    @suspect_post_report = SuspectPostReport.new
    @suspect_post_report.suspect_post_id = @temp.id
    @suspect_post_report.user = current_user
    @suspect_post_report.kind = "fake"
    if @suspect_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @suspect_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  def report3_suspect
    @temp = MissingPost.find(params[:id])
    @suspect_post_report = SuspectPostReport.new
    @suspect_post_report.suspect_post_id = @temp.id
    @suspect_post_report.user = current_user
    @suspect_post_report.kind = "duplicate"
    if @suspect_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @suspect_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  def create
    @suspect_post = SuspectPost.create(suspect_post_params)

    if @suspect_post.save
      flash[:notice] = "Your Post has been created successfully"
      redirect_to @suspect_post
    else
      render 'new'
    end
  end

  def show
    @suspect_post = SuspectPost.find(params[:id])
  end

  protected

  def suspect_post_params
    params.require(:suspect_post).permit(:approximate_age, :gender, :location, :image, :description,
      :special_signs, :reporter_name, :reporter_phone)
  end
end
