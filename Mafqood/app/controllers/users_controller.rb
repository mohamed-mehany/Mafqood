class UsersController < ApplicationController
  def new
    auth = env["omniauth.auth"]
    @user = User.where("uid = ?", auth.uid).first
    if @user
      session[:user_id] = @user.id
      redirect_to request.referer || root_url
    end
    @user = User.new(
      provider:  auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email,
      oauth_token: auth.credentials.token, oauth_expires_at: Time.at(auth.credentials.expires_at)
    )
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to request.referer || root_url
    else
      render "new"
    end
  end
  
  def user_params
    params.require(:user).permit(:provider, :uid, :name, :email, :oauth_token, :oauth_expires_at)
  end
end
