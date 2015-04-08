class MissingPostsController < ApplicationController
  def index
    @missing_posts = MissingPost.order("created_at desc")
  end

  def show
    @missing_post = MissingPost.find(params[:id])
  end

  def new
    @missing_post = MissingPost.new
  end

 
  # def send_report
  #   if (current_user)
  #     @missing_post = Report.new(finding_report)
  #     @missing_post.user = current_user
  #   if @missing_post.save
  #         redirect_to Post.find(@MissingPost.report.post_id), notice: "Your have reported successfully"
  #     else
  #       flash[:alert] = @missing_post.errors.full_messages
  #       render 'new'
  #     end
  #   else
  #     redirect_to root_url, alert: ["Must be logged in..."]
  #   end
  # end  
  
  # + # Author: Sherif Ahmed
  # + Report_x is a generic method that takes report type as a param,
  # + then move on to get the current post id and user id and insert them to report table

def report11_missing
    @temp = MissingPost.find(params[:id])
    @missing_post_report = MissingPostReport.new
    @missing_post_report.missing_post_id = @temp.id
    @missing_post_report.user = current_user
    @missing_post_report.kind = "spam"
    if @missing_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @missing_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  def report22_missing
    @temp = MissingPost.find(params[:id])
    @missing_post_report = MissingPostReport.new
    @missing_post_report.missing_post_id = @temp.id
    @missing_post_report.user = current_user
    @missing_post_report.kind = "fake"
    if @missing_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @missing_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  def report33_missing
    @temp = MissingPost.find(params[:id])
    @missing_post_report = MissingPostReport.new
    @missing_post_report.missing_post_id = @temp.id
    @missing_post_report.user = current_user
    @missing_post_report.kind = "duplicate"
    if @missing_post_report.save
      redirect_to({ action: "index"}, notice: "You have successfully reported this post")
    else
      flash[:alert] = @missing_post_report.errors.full_messages
      redirect_to action: "index"
    end
  end

  

  def create
    if (current_user)
      @missing_post = MissingPost.new(missing_params)
      @missing_post.user = current_user
      if @missing_post.save
        flash[:notice] = "Your Post has been created successfully"
        redirect_to @missing_post
      else
        render 'new'
      end
    else
      redirect_to root_url, alert: ["Must be logged in..."]
    end
  end

 private

  def missing_params
    params.require(:missing_post).permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
  end

  # def finding_report
  #   params.require(:report).permit(:user_id,:post_id,:post_kind)
  # end
end
