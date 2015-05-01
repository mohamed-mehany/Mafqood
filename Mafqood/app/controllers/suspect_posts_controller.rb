class SuspectPostsController < ApplicationController
  def index
    @suspects = SuspectPost.order("created_at desc")
  end

  def show
  end

  def new
    @suspect_post = SuspectPost.new
  end

  def create
    @suspect_post = SuspectPost.create(suspect_post_params)

    if @suspect_post.save
      save_action
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
