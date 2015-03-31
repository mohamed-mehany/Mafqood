class MissingPostsController < ApplicationController
  # before_filter :auth, only: [:create, :new, :mine]

  def index
    @missing_posts = MissingPost.new
    @missing_posts = MissingPost.order("created_at desc")
  end

  def report
    if(current_user)
    @missing_posts = MissingPost.order("created_at desc")
    @missing = MissingPost.find(params[:id])
    @missing_post_report = MissingPostReport.new
    @missing_post_report.type = "mine"
    @missing_post_report.user_id = current_user.id
    @missing_post_report.missing_post_id = @missing.id
    @missing_post_report.save
    # redirect_to @missing, notice: ["congratulations :D"]
    end
  end

  def show
    @missing_post = MissingPost.find(params[:id])
  end

  def new
    @missing_post = MissingPost.new
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

end
