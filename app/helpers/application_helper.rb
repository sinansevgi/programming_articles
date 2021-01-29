module ApplicationHelper
  def user_buttons
    login_button = link_to("Log In", login_path)
    logout_button = link_to("Log Out", logout_path)
    signup_button = link_to("Sign Up", signup_path)
    return logout_button if current_user

    login_button + signup_button
  end

  def vote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Unvote!', category_article_vote_path(id: like.id, article_id: article.id), method: :delete)
    else
      link_to('Vote!', category_article_vote_path(article_id: article.id), method: :post)
    end
  end
end
