class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, class_name: 'Article'
  has_many :votes
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :name, length: { minimum: 4 }

  def all_articles(&block)
    part1 = articles(&block).includes([image_attachment: :blob]).includes([:author])
    part1.includes([:rich_text_text]).includes([:article_categorizations]).includes([:categories])
  end

  def find_vote(article)
    votes.find_by(article_id: article.id)
  end
end
