class ArticleCategorization < ApplicationRecord
  belongs_to :article
  belongs_to :category

  accepts_nested_attributes_for :category

end
