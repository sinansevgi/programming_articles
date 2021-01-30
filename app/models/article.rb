class Article < ApplicationRecord
  validates :title, presence: true

  belongs_to :author, class_name: 'User'
  has_many :article_categorizations, foreign_key: :article_id
  has_many :categories, through: :article_categorizations
  has_many :votes, dependent: :destroy
  has_rich_text :text

  has_one_attached :image

  scope :most_voted, -> { order(:votes_count).limit(5) }
end
