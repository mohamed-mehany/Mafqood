class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to request.referer || root_url
  end
end
