require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'Validations' do
    subject { create(:day) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should belong_to(:week) }
    it { should validate_presence_of(:meal_id) }
  end
end
