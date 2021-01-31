require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new(name: 'test') }

  describe 'validation tests' do
    it 'ensures category presence' do
      expect { Category.create!(name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new record' do
      expect(category.name).to eq('test')
    end
  end

  describe 'associations tests' do
    it { should have_many(:articles) }
  end
end
