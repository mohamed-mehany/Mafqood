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
 
  def send_report
    if (current_user)
      @missing_post = Report.new(finding_report)
      @missing_post.user = current_user
    if @missing_post.save
          redirect_to Post.find(@MissingPost.report.post_id), notice: "Your have reported successfully"
      else
        flash[:alert] = @missing_post.errors.full_messages
        render 'new'
      end
    else
      redirect_to root_url, alert: ["Must be logged in..."]
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

  def finding_report
    params.require(:report).permit(:user_id,:post_id,:post_kind)
  end
end
