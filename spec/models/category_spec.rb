require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create!(name: 'test') }

  describe 'validation tests' do
    it 'ensures category presence' do
      expect { Category.create!(name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new record' do
      expect(category.name).to eq('test')
    end
    it { should validate_presence_of(:name) }
    it { should_not allow_value('').for(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations tests' do
    it { should have_many(:articles) }
  end
end
