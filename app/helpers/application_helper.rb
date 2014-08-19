module ApplicationHelper

  def user_login_links
    if user_signed_in?
      content_tag(:span, current_user.email, style: "color:red;") +
        (link_to "Edit", edit_user_registration_path) +
        (link_to "Log Out", destroy_user_session_path, method: :delete)
    else
      link_to "Sign In/Sign Up", new_user_session_path
    end
  end
end
