require 'rails_helper'

feature 'Journal', js: true do
  let(:user){create(:user)}

  scenario 'when user visits journal page' do
    Timecop.freeze Time.local(2017, 10, 24, 12, 0, 0) do
      given_a_user
      with_month_entries
      and_with_entries_today

      when_logged_in
      and_visits_journal_page

      user_sees_journal_title
      user_sees_list_of_today_entries

      when_selecting_month_entries_tab
      user_sees_list_of_month_entries
    end
  end

  def given_a_user
    @user           = create(:user)
    @journal        = @user.current_year_journal
    @journal_months = @journal.months
  end

  def with_month_entries
    @month_entries_october = create_list(:journal_month_entry, 2, :note,
                                         month: @journal_months.find_by(month: 10))
  end

  def and_with_entries_today
    @today_entries = create_list(:journal_entry, 3, :task,
                                 target_date: Date.today,
                                 journal: @journal)
  end

  def when_logged_in
    login_as @user
  end

  def and_visits_journal_page
    visit '/journal'
  end

  def user_sees_journal_title
    expect(page).to have_text('My Journal - 2017')
  end

  def user_sees_list_of_today_entries
    @today_entries.each do |entry|
      expect(page).to have_text(entry.title)
    end
  end

  def when_selecting_month_entries_tab
    click_on 'Month Entries'
  end

  def user_sees_list_of_month_entries
    @month_entries_october.each do |entry|
      expect(page).to have_text(entry.title)
    end
  end
end
