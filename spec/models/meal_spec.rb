require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'Validations' do
    subject { create(:meal) }

    it 'is valid with valid attributes' do
      # expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
  end
end
