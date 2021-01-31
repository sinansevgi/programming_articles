class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :article_categorizations, foreign_key: :category_id
  has_many :articles, through: :article_categorizations

  scope :all_categories, -> { order(priority: :desc) }

  before_destroy :uncategorize_all_articles

  def latest_articles
    part1 = articles.includes([image_attachment: :blob]).includes([:author])
    part1.includes([:rich_text_text]).order(created_at: :desc)
  end

  private

  def uncategorize_all_articles
    article_categorizations.each(&:destroy)
  end
end
