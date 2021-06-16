require 'rails_helper'

RSpec.describe Week, type: :model do
  describe 'Validations' do
    subject { create(:week) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:start_date) }
    it { should have_many(:days) }
  end
end
