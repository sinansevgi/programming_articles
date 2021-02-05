require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(name: 'test') }
  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/github.png'), 'image/png', true)
  end
  let(:article) { Article.create!(title: 'test', image: image, author_id: user.id, text: 'Test') }

  describe 'validation tests' do
    it 'ensures content presence' do
      expect { Article.create!(author_id: user.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:text) }
    it { should_not allow_value('').for(:title) }

    it 'should not validate article without an image' do
      article.image = nil
      expect(article.valid?).to be(false)
    end

    it 'creates a new record' do
      expect(article.title).to eq('test')
    end
    it 'should not create article without image' do
      expect { Article.create!(author_id: user.id, title: 'test', text: test, image: '') }.to raise_error(ArgumentError)
    end
  end

  describe 'associations tests' do
    it { should belong_to(:author) }
    it { should have_many(:votes) }
    it { should have_many(:categories) }
    it { should have_one_attached(:image) }
    it { should have_rich_text(:text) }
  end
end
