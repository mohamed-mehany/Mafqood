class FindingPostsController < ApplicationController
  def index
    @finding_posts = FindingPost.order("created_at desc")
  end

  def show
  end

  def new
   @finding_post = FindingPost.new
  end

  def create
    if (current_user)
    	@finding_post = FindingPost.new(finding_post_params)
    	@finding_post.user = current_user
      if @finding_post.save
        redirect_to @finding_post, notice: "Your new post have been created successfully!"
      else
        flash[:alert] = @finding_post.errors.full_messages
        render 'new'
	    end
    else
      redirect_to root_url, alert: ["Must be logged in..."]
    end
  end

protected
  def finding_post_params
    params.require(:finding_post).permit(:name,:contact_info,:description,:age,:special_signs,:image,:location,:gender)
  end
end
