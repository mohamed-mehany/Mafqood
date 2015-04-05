class MissingPostsController < ApplicationController
  # before_filter :auth, only: [:create, :new, :mine]

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

# to edit post getting the user id and matching it with the current user
# if equal render to new to edit the post else prints alert message

    def edit
    @missing = MissingPost.find(params[:id])
    if current_user == @missing.user
      @missing_post = @missing
      render 'new'
    else
      redirect_to @missing, alert: "You are not allowed to edit this post."
    end
  end

  def update
    @missing = MissingPost.find(params[:id])
    if @missing.update(missing_params)
      redirect_to @missing, notice: "Post updated successfully"
    else
      render 'new'
    end
  end

# Public: Report this missing post as mine i.e this kid is my kid.
#
# Examples
#
#   mine #i.e this method is called when a user navigates to
#   /missing_posts/:id/mine
#
#   # => @missing_post_report.save
#
# Redirects the user to the missings post index and displays a flash
# whether the report was successful or not.

  def report
    if(current_user)
    @missing_posts = MissingPost.order("created_at desc")
    @missing = MissingPost.find(params[:id])
    @missing_post_report = MissingPostReport.new
    @missing_post_report.kind = "mine"
    @missing_post_report.user_id = current_user.id
    @missing_post_report.missing_post_id = @missing.id
    @missing_post_report.save
    # redirect_to @missing, notice: ["congratulations :D"]
    end
  end

 protected
 # Protected: Redirects the user to the homepage unless he is logged in

 def missing_params
   params.require(:missing_post).permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
 end

end
