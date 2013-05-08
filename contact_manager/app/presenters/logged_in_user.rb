class LoggedInUser < Draper::Decorator
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  def auth_link
    # "<a data-method='delete' href='/logout'>Logout</a>".html_safe
    link_to "Logout", logout_path, method: 'delete'
  end

  def controller ; end
end
