module ArticlesHelper
  def vote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('',article_vote_path(id: vote.id, article_id: article.id), method: :delete, class: 'fas fa-star')
    else
      link_to('',article_votes_path(article_id: article.id), method: :post,  class: 'far fa-star')
    end
  end

  def article_buttons(article)
    link_to(' Edit ', edit_article_path(article), class: 'fas fa-pencil-alt') if article.author.id == current_user.id
  end

end
