class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :article_categorizations, foreign_key: :category_id
  has_many :articles, through: :article_categorizations

  scope :all_categories, -> { order(priority: :desc) }

  before_destroy :uncategorize_all_articles
  after_destroy :set_no_category

  def latest_articles
    part1 = articles.includes([image_attachment: :blob]).includes([:author])
    part1.includes([:rich_text_text]).order(created_at: :desc)
  end

  private

  def uncategorize_all_articles
    article_categorizations.each(&:destroy)
  end

  def set_no_category
    Article.all.each do |article|
      next unless article.categories.empty?

      category = Category.find_by(name: 'No-category')
      ArticleCategorization.create!(article_id: article.id, category_id: category.id) unless category.nil?
      category = Category.create!(name: 'No-category', priority: 1) if category.nil?
      ArticleCategorization.create!(article_id: article.id, category_id: category.id) if category.nil?
    end
  end
end
