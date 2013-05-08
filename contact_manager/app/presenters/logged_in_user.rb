class LoggedInUser
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def auth_link
    # "<a data-method='delete' href='/logout'>Logout</a>".html_safe
    link_to "Logout", logout_path, method: 'delete'
  end

  def logged_in?
    true
  end

  delegate :created_at, :updated_at, to: :user


  def controller ; end
end
