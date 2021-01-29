class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id, class_name: 'Article'
  validates_uniqueness_of :name
end
