require 'rails_helper'

RSpec.describe Journal::EntriesController do
  let(:user){create(:user)}
  let(:mock_today){Time.local(2018, 01, 16, 12, 0, 0)}
  let(:journal){user.current_year_journal}
  let(:entries) do
    Journal::Entry.create([
      attributes_for(:journal_entry, :note,  journal: journal, target_date: mock_today),
      attributes_for(:journal_entry, :task,  journal: journal, target_date: mock_today),
      attributes_for(:journal_entry, :event, journal: journal, target_date: mock_today + 1.day),
      attributes_for(:journal_entry, :task,  journal: journal, target_date: mock_today + 2.day)
    ])
  end

  describe 'GET show' do
    before do
      Timecop.freeze mock_today
      entries
      stub_login_user(user)
    end

    after do
      Timecop.return
    end

    it 'renders list of entries for the given day on the journal' do
      get :show, format: :json, params: {day: mock_today.to_s}

      hash_entries = JSON.parse(response.body)

      expect(hash_entries.length).to eq(2)
      hash_entries.each_with_index do |hash_entry, index|
        from_json = Journal::Entry.new(hash_entry)
        expected  = Journal::Entry.new(entries[index].attributes)
        expect(from_json).to eq(expected)
      end
    end
  end
end
