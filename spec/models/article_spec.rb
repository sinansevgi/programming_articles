require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.new(name: 'test') }
  let(:article) { Article.new(title: 'test') }

  describe 'validation tests' do
    it 'ensures content presence' do
      expect { Article.create!(author_id: user.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it 'creates a new record' do
      expect(article.title).to eq('test')
    end
  end

  describe 'associations tests' do
    it { should belong_to(:author) }
    it { should have_many(:votes) }
    it { should have_many(:categories) }
  end
end
