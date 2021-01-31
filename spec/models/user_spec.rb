require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'test') }

  describe 'validation tests' do
    it 'ensures name presence' do
      expect { User.create!(name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'creates a new record' do
      expect(user.name).to eq('test')
    end
  end

  describe 'association tests' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
