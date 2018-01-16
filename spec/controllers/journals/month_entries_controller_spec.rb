require 'rails_helper'

RSpec.describe Journals::MonthEntriesController do
  let(:user){create(:user)}
  let(:journal){user.current_year_journal}
  let(:month_entries) do
      Journal::MonthEntry.create([
        attributes_for(:journal_month_entry, :note,  month: journal.months.find_by(month: 10)),
        attributes_for(:journal_month_entry, :task,  month: journal.months.find_by(month: 10)),
        attributes_for(:journal_month_entry, :event, month: journal.months.find_by(month: 11)),
        attributes_for(:journal_month_entry, :task,  month: journal.months.find_by(month: 12))
      ])
  end

  describe 'GET show' do
    before do
      mock_today = Time.local(2017, 10, 24, 12, 0, 0)
      Timecop.freeze mock_today
      month_entries
      stub_login_user(user)
    end

    after do
      Timecop.return
    end

    it 'renders list of month entries for the given month on the journal' do
      get :show, format: :json, params: {month: 10}
      hash_month_entries = JSON.parse(response.body)

      expect(hash_month_entries.length).to eq(2)
      hash_month_entries.each_with_index do |hash_month_entry, index|
        from_json = Journal::MonthEntry.new(hash_month_entry)
        expected  = Journal::MonthEntry.new(month_entries[index].attributes)
        expect(from_json).to eq(expected)
      end
    end
  end
end
