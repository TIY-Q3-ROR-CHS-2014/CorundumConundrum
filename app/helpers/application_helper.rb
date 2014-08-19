module ApplicationHelper
  def is_link_active?(clicked_controller)
    "active" if clicked_controller == params[:controller]
  end
  def user_login_links
    if user_signed_in?
      content_tag(:span, current_user.email, style: "color:grey;") +
        (link_to "Account", edit_user_registration_path) +
        (link_to "Log Out", destroy_user_session_path, method: :delete)
    else
      link_to "Sign In/Sign Up", new_user_session_path
    end
    
  end

  # def mineral_stats
  #   "#{@mineral.name} - #{@mineral.moh} - #{@mineral.origin}"
  # end
end
