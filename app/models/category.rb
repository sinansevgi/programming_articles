class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :article_categorizations, foreign_key: :category_id
  has_many :articles, through: :article_categorizations

  scope :all_categories, -> { order(:name) }

  before_destroy :uncategorize_all_articles

  def most_voted_articles
    articles.order(:votes_count).limit(5)
  end

  def latest_articles
    articles.order(created_at: :desc)
  end

  private
  def uncategorize_all_articles
    article_categorizations.each(&:destroy)
  end

end
