class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit]

  # Public: Initialises a new user ActiveRecord with one telephone and one address.
  def new
    @user = User.new(name: session[:name], email: session[:email])
    @user.telephones.build
    @user.addresses.build
  end

  # Public: Creates a user if the ActiveRecord is valid, otherwise renders new again.
  def create
    @user = User.new(user_params)
    if @user.save
      Account.create(user_id: @user.id, provider: params[:provider], uid: params[:uid])
      session.delete(:provider)
      session.delete(:uid)
      session.delete(:name)
      session.delete(:email)
      session[:user_id] = @user.id
      redirect_to root_url, notice: t("users.successful_login")
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end

  # Public: Sends a @user variable having the current_user to the edit form.
  def edit
    @user = current_user
  end

  # Public: Updates the user ActiveRecord with the new values in the user edit form.
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_profile_path, notice: t("users.successful_update")
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end
  
  # Public: Assigns the finding posts and missing posts of the current user to variables to be passed to the view.
  def posts
    @finding_posts = current_user.finding_posts
    @missing_posts = current_user.missing_posts
  end
  
  private
  
  # Private: Gets the parameters for the user form.
  #
  # Returns the allowed user params for mass assignment.
  def user_params
    params.require(:user).permit(
      :name, :email, telephones_attributes: [:id, :number, :_destroy],
      addresses_attributes: [:id, :text, :_destroy]
    )
  end
end
