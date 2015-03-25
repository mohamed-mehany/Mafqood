class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit]
  
  def new
    @user = User.new(name: session[:name], email: session[:email])
    @user.telephones.build
    @user.addresses.build
  end
  
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path, notice: t("users.successful_update")
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end
  
private
  def user_params
    params.require(:user).permit(
      :name, :email, telephones_attributes: [:id, :number, :_destroy],
      addresses_attributes: [:id, :text, :_destroy]
    )
  end
end
