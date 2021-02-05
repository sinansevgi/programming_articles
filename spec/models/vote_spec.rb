require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user2) { User.create!(name: 'test2') }
  let(:user) { User.create!(name: 'test') }
  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/github.png'), 'image/png', true)
  end
  let(:article) { user.articles.create!(title: 'test', image: image, text: 'text') }
  let(:vote) { Vote.create!(user_id: user2.id, article_id: article.id) }

  describe 'validation tests' do
    it 'ensures user presence' do
      expect { article.votes.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'ensures articles presence' do
      expect { user.votes.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'ensures user not nil' do
      expect(vote.user_id).to_not be_nil
    end
    it 'ensures record is unique' do
      Vote.create!(user_id: user2.id, article_id: article.id)
      expect { article.votes.create!(user_id: user2.id) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'associations tests' do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
end
