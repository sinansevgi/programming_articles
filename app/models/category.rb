class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :article_categorizations, foreign_key: :category_id
  has_many :articles, through: :article_categorizations
end
