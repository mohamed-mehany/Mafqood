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
  
  # Private: Gets the float value depending on the language of the website.
  #
  # text  - The float direction needed to be converted.
  #
  # Examples
  #
  # Arabic:
  #   float("left")
  #   # => "right"
  #   float("right")
  #   # => "left"
  # English:
  #   float("left")
  #   # => "left"
  #   float("right")
  #   # => "right"
  #
  # Returns the float converted value.
  # def float(direction)
  #   if cookies[:locale] == "en"
  #     direction
  #   else
  #     direction == "left" ? "right" : "left"
  #   end
  # end
  
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
  # Returns the current user as an ActiveRecord or nil if the user is not signed in.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Private: Starts the user sign in/sign up operation.
  #
  # Redirects to the login path to start signing in.
  def authenticate_user!
    redirect_to request.referer || root_url, notice: t("login_to_view") unless session[:user_id]
  end
end
