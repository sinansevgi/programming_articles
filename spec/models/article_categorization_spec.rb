require 'rails_helper'

RSpec.describe ArticleCategorization, type: :model do
  let(:category) { Category.create!(name: 'test') }
  let(:user) { User.create!(name: 'test') }
  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/github.png'), 'image/png', true)
  end
  let(:article) { Article.create!(title: 'test', image: image, author_id: user.id, text: 'Test') }
  let(:categorization) { ArticleCategorization.create!(article_id: article.id, category_id: category.id) }

  describe 'validations tests' do
    it 'should validate with valid data' do
      expect(categorization.valid?).to be(true)
    end

    it 'should save new categorization to database' do
      expect(categorization.save).to be(true)
      expect(categorization.id).to_not be_nil
    end
  end

  describe 'associations tests' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
    it { should accept_nested_attributes_for(:category) }
  end
end
