class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :float
  before_action :set_locale
  
  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
      redirect_to request.referer || root_url
    end
    I18n.locale = cookies[:locale] || I18n.default_locale
  end
  
  private
  
  def float(direction)
    if cookies[:locale] == "en"
      direction
    else
      direction == "left" ? "right" : "left"
    end
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to request.referer || root_url, notice: t("login_to_view") unless session[:user_id]
  end
end
