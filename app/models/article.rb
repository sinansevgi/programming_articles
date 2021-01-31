class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true

  belongs_to :author, class_name: 'User'
  has_many :article_categorizations, foreign_key: :article_id
  has_many :categories, through: :article_categorizations
  has_many :votes, dependent: :destroy
  has_rich_text :text

  has_one_attached :image

  scope :most_voted, -> { order(votes_count: :desc).first }

  before_destroy :remove_category_assignments

  private
  def remove_category_assignments
    article_categorizations.each(&:destroy)
  end

end
