class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    unless @current_user
      user = User.find_by_id(session[:user_id])
      if user
        @current_user = LoggedInUser.new(user)
      else
        @current_user = AnonymousUser.new
      end
    end
    @current_user
  end

end
