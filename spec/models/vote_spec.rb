require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user2) { User.create!(name: 'test2') }
  let(:user) { User.create!(name: 'test') }
  let(:article) { user.articles.create!(title: 'test', image: 'test') }

  describe 'validation tests' do
    it 'ensures user presence' do
      expect { article.votes.create! }.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
    end
  end

  describe 'associations tests' do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
end
