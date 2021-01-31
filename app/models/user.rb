class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, class_name: 'Article'
  has_many :votes
  validates_uniqueness_of :name

  def all_articles(&block)
    articles(&block).includes([image_attachment: :blob]).includes([:author]).includes([:rich_text_text]).includes([:article_categorizations]).includes([:categories])
  end

  def find_vote(article)
    votes.find_by(article_id: article.id)
  end
end
