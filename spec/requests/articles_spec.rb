require 'rails_helper'

RSpec.describe '/articles', type: :request do
  let(:user) do
    User.create!(name: 'test')
  end

  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/github.png'), 'image/png', true)
  end

  let(:valid_attributes) do
    { title: 'test', text: 'test', author_id: user.id, image: image }
  end

  let(:invalid_attributes) do
    Article.new(email: 'test@test.com')
  end

  before(:each) do
    visit login_path
    fill_in 'name', with: user.name
    click_button 'commit'
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Article.create! valid_attributes
      get root_url
      expect(response).to be_successful
    end
  end

  describe 'GET /create' do
    it 'renders a successful response' do
      expect do
        Article.create! valid_attributes
        post articles_url, params: valid_attributes
      end.to change(Article, :count).by(1)
      end
    end

  describe 'GET /show' do
    it 'renders a successful response' do
      article = Article.create! valid_attributes
      get article_url(article)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested article' do
      article = Article.create! valid_attributes
      expect do
        delete article_url(article)
      end.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      article = Article.create! valid_attributes
      delete article_url(article)
      expect(response).to redirect_to(root_path)
    end
  end
end
