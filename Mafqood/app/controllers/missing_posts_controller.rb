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

  def create
    if (current_user)
      @missing_post = MissingPost.new(missing_post_params)
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
    @missing_post.status == false ? @missing_post.status = 1 : @missing_post.status = 0
    @missing_post.save
    flash[:notice] = "Your Post status has been updated successfully"
    redirect_to my_posts_path
  end

 private

 def missing_post_params
   params.require(:missing_post).permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
 end

end
