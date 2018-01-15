require 'rails_helper'

RSpec.describe Journal::MonthEntry do

  it {is_expected.to define_enum_for(:entry_type).with([:task, :event, :note])}

  describe 'Associations' do
    it {is_expected.to belong_to :month}
  end

  describe 'Scopes' do
    describe 'on_month' do
      it 'returns month entries where the month is on the given month argument' do
        user           = create(:user)
        journal_months = user.current_year_journal.months.to_a
        entry_a        = create(:journal_month_entry, month: journal_months[0])
        entry_b        = create(:journal_month_entry, month: journal_months[1])
        entry_c        = create(:journal_month_entry, month: journal_months[1])

        expected = [entry_b, entry_c]
        result   = Journal::MonthEntry.on_month(journal_months[1].month)

        expect(result.to_a).to eq(expected)
      end
    end
  end

  describe 'Validations' do
    subject{build(:journal_month_entry, entry_type: 'task')}
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:month)}
    it {is_expected.to validate_presence_of(:entry_type)}
  end
end
