require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'with valid login' do
    it 'create a new session' do
      User.create!(name: 'Test User')
      visit '/login'
      fill_in 'name', with: 'Test User'
      click_button 'commit'
      expect(current_path).to eq(root_path)
    end
    it 'doesnt create a new session' do
      User.create!(name: 'Test User')
      visit '/login'
      fill_in 'name', with: 'Test User2'
      click_button 'commit'
      expect(current_path).to eq(sessions_path)
    end
  end
  describe 'DELETE /destroy' do
    it 'destroys the current sessoion' do
      visit '/logout'
      expect(current_path).to eq(login_path)
    end
  end
end
