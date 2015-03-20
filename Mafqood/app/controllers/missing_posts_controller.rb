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
    @missing_post = MissingPost.new(params[:missing_post].permit(:age, :location, :reporter_name, :reporter_phone, :description, :image, :gender, :special_signs))

    if @missing_post.save
      flash[:notice] = "Your Post has been created successfully"
      redirect_to @missing_post
    else
      render 'new'
    end
  end

  protected


end
