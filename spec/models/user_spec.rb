require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it {is_expected.to have_many :drafts}
    it {is_expected.to have_many :journals}
    it {is_expected.to have_one  :current_year_journal}

    describe 'current_year_journal' do
      it 'returns journal of the user with the current year' do
        Timecop.freeze(Time.local(2012, 10, 22, 12, 0, 0)) do
          user = create(:user)
          expect(user.current_year_journal.year).to eq(2012)
        end
      end
    end
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:email)}
  end

  describe 'Callbacks' do
    describe 'After create' do
      it 'creates a current_year_journal for the user' do
        Timecop.freeze(Time.local(2017, 10, 22, 12, 0, 0)) do
          user = build(:user)
          expect(user.current_year_journal).to be_nil
          expect{user.save}.to change(Journal, :count).by(1)
          expect(user.current_year_journal).to_not be_nil
        end
      end
    end
  end
end
