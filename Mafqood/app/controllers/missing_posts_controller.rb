class MissingPostsController < ApplicationController
  def index
    @missing_post = MissingPost.new
    render 'new'
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
    end
  end

 private

 def missing_params
   params.require(:missing_post).permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs)
 end

end
