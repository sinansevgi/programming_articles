module ApplicationHelper
  def user_buttons
    login_button = link_to("LOG IN", login_path, class: 'mx-1 my-0 my-sm-3')
    logout_button = link_to("LOG OUT", logout_path, class: 'mx-1 my-0 my-sm-3')
    signup_button = link_to("SIGN UP", signup_path, class: 'mx-1 my-0 my-sm-3')
    user_link ||= link_to(current_user.name, user_path(current_user), class: "mx-1 my-0 my-sm-3") if current_user
    new_article_button = link_to('NEW ARTICLE', new_article_path, class: 'mx-1 my-0 my-sm-3')
    return user_link + new_article_button + logout_button if current_user

    login_button + signup_button
  end

  def nav_link(text, path)
    options = current_page?(path) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path, class: 'nav-link'
    end
  end

end
