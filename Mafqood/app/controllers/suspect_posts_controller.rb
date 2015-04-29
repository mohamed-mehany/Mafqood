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
    @suspect_post.ip = request.remote_ip
    if @suspect_post.save
      @action = session[:action]+1
      session[:action] = @action
      if session[:action] > 2
        @spammer = Spammer.new
        if current_user
          @spammer.user_id = current_user.id
        end
        @spammer.user_ip = request.remote_ip
        @spammer.kind = "verified"
        @spammer.save
      end
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
