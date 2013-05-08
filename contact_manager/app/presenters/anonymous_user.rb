class AnonymousUser < Draper::Decorator

  def auth_link
    # "<a href='/auth/twitter'>Login</a>".html_safe
    # link_to "Login", "/auth/twitter"
    link_to "Login", login_path
  end

end