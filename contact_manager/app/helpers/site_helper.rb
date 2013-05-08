module SiteHelper

  def current_user_auth_link
    if current_user.present?
      text = link_to "Logout", logout_path, method: 'delete'
    else
      text = link_to "Login", login_path
    end

    "<div style='color: red;'>#{text}</div>".html_safe
  end

  def current_user_auth_link
    if current_user.present?
      content_tag :div, class: "hello" do
        content_tag :p, class: "zumba" do
          link_to "Logout", logout_path, method: 'delete'
        end
      end

      render partial: "zumba_auth_link", locals: { path: logout_path, method: 'delete' }
    else
      content_tag :div, class: "hello" do
        link_to "Login", login_path
      end
    end


  end

end