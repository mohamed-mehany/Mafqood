class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #, :float
  before_action :set_locale

  # Public: Sets the locale of the website according to the params[:locale] hash.
  #
  # Redirects to the referer if exists, otherwise root url.
  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
      redirect_to request.referer || root_url
    end
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

  private

  # Private: Gets the current user that is signed in.
  #
  # Examples
  #
  # Signed in:
  #   current_user
  #   # => ActiveRecord of the currently signed in user
  # Not signed in:
  #   # => nil
  #
  # def session_ip
  #   session[:ip] = request.remote_ip
  #   session[:action] = 0
  # end

  # Returns the current user as an ActiveRecord or nil if the user is not signed in.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Private: Starts the user sign in/sign up operation.
  #
  # Redirects to the login path to start signing in.
  def authenticate_user!
    redirect_to login_path(:facebook) unless session[:user_id]
  end
end
