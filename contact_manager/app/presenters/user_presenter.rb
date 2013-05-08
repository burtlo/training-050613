class UserPresenter

  def initialize(user)
    @user = user
  end

  def auth_link
    if user
      link_to "Logout", logout_path, method: 'delete'
    else
      link_to "Login", login_path
    end
  end

end