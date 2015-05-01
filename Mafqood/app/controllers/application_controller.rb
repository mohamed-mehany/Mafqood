class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user #, :float
  before_action :set_locale ,:session_ip

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

  def save_action
    @find = Action.find_by user_ip: session[:ip]
    if @find
      if current_user
        @find.kind = "verified"
        @find.user_id = current_user.id
      end
      @number = @find.action_num
      @find.action_num = @number+1
      if @find.action_num > 4
        @spammer = Spammer.new
        @spammer.user_id = @find.user_id
        @spammer.user_ip = @find.user_ip
        @spammer.kind = @find.kind
        @spammer.save
      end
      @find.save
    else
      @action = Action.new
      if current_user
        @action.user_id = current_user.id
        @action.kind = "verified"
      else
          @action.kind = "unverified"
      end
        @action.user_ip = session[:ip]
        @action.action_num = 1
        @action.save
    end
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
  def session_ip
    session[:ip] = request.remote_ip
  end

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
