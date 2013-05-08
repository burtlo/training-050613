class AnonymousUser
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  def auth_link
    # "<a href='/auth/twitter'>Login</a>".html_safe
    # link_to "Login", "/auth/twitter"
    link_to "Login", login_path
  end

  def controller ; end

  def logged_in?
    false
  end

end