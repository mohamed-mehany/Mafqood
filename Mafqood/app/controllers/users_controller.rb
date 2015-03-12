class UsersController < ApplicationController
  def new
    @user = User.new(name: session[:name], email: session[:email])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      Account.create(user_id: @user.id, provider: params[:provider], uid: params[:uid])
      session[:user_id] = @user.id
      redirect_to root_url, notice: t("users.successful_login")
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
