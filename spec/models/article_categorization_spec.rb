require 'rails_helper'

RSpec.describe ArticleCategorization, type: :model do
  describe 'associations tests' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
  end
end
