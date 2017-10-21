require 'rails_helper'

describe Journal do

  let(:user){create(:user)}

  describe 'Associations' do
    it {is_expected.to belong_to :user}
  end

  describe 'Validations' do
    subject {build(:journal, user: user, year: 2017)}
    it {is_expected.to validate_presence_of(:year)}
    it {is_expected.to validate_presence_of(:user)}
    it {is_expected.to validate_presence_of(:status)}
    it {is_expected.to validate_uniqueness_of(:year).scoped_to(:user_id)}
  end

  describe 'Callbacks' do
    describe 'after_create' do
      it 'creates twelve Journal::Month' do
        journal = create(:journal, :active, user: user)
        journal_months = journal.months.order(month: :asc)

        expect(journal_months.length).to eq(12)

        (1..12).each do |month|
          index = month - 1
          expect(journal_months[index].month).to eq(month)
        end
      end
    end
  end
end
