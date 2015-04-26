class SessionsController < ApplicationController
  def new
    auth = env["omniauth.auth"]
    account = Account.find_by_provider_and_uid(auth.provider, auth.uid)
    if account
      session[:user_id] = account.user.id
      @ip = request.remote_ip
      session[:ip] = @ip
      session[:action] = 0
      redirect_to root_url, notice: t("users.successful_login")
    elsif current_user
      @ip = request.remote_ip
      session[:ip] = @ip
      session[:action] = 0
        Account.create(user_id: current_user.id, provider: auth.provider, uid: auth.uid)
        redirect_to root_url, notice: t("users.successful_login")
    else
      @ip = request.remote_ip
      session[:ip] = @ip
      session[:action] = 0
      session[:provider] = auth.provider
      session[:uid] = auth.uid
      session[:name] = auth.info.name
      session[:email] = auth.info.email
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: t("users.successful_logout")
  end
end
