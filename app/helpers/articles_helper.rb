module ArticlesHelper
  def vote_btn(article)
    if current_user
      vote = Vote.find_by(article: article, user: current_user)
      if vote
        text = 'Remove your vote'
        link_to('', article_vote_path(id: vote.id, article_id: article.id),
                { method: :delete, class: 'fas fa-star', 'data-toggle' => 'tooltip', 'data-placement' => 'left', 'title' => text })
      else
        text = 'Give upvote to article'
        link_to('', article_votes_path(article_id: article.id),
                         { method: :post, class: 'far fa-star', 'data-toggle' => 'tooltip', 'data-placement' => 'left', 'title' => text })
      end
    end
  end

  def article_buttons(article)
    if current_user && (article.author.id == current_user.id)
      link_to(' Edit ', edit_article_path(article), class: 'fas fa-pencil-alt')
    end
  end

  def image_show(article)
    image_tag(article.image) if article.image.present?
  end
end