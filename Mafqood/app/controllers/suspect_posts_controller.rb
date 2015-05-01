class SuspectPostsController < ApplicationController
  
  def index
    if params[:query].present?
      @suspects = SuspectPost.search(params[:key], load: true).result
    else
    @suspects = SuspectPost.order("created_at desc")
  end
end
  
  def search
    @suspects = SuspectPost.search(params[:query], load: true).result
  end

  def show
  end

  def new
    @suspect_post = SuspectPost.new
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
    params.require(:suspect_post).permit(:approximate_age, :gender, :location_id, :image, :description,
      :special_signs, :reporter_name, :reporter_phone)
  end
end
