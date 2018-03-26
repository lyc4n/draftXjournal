require 'rails_helper'

feature 'Journal', js: true do
  let(:today){Time.local(2017, 10, 24, 12, 0, 0)}
  let(:next_month){Time.local(2017, 11, 24, 12, 0, 0)}

  scenario 'when user visits journal page' do
    Timecop.freeze today do
      given_a_user
      with_month_entries
      and_with_entries_today_and_another_day

      when_logged_in
      and_visits_journal_page

      user_sees_journal_title
      user_sees_list_of_today_entries

      when_selecting_month_entries_tab
      user_sees_list_of_month_entries

      when_selecting_different_date
      user_sees_list_of_another_month_entries
      when_selecting_day_entries_tab
      user_sees_list_of_another_day_entries
    end
  end

  def given_a_user
    @user           = create(:user)
    @journal        = @user.current_year_journal
    @journal_months = @journal.months
  end

  def with_month_entries
    @month_entries_october = create_list(:journal_month_entry, 2, :note,
                                         month: @journal_months.find_by(month: today.month))

    @month_entries_november = create_list(:journal_month_entry, 2, :note,
                                         month: @journal_months.find_by(month: next_month.month))
  end

  def and_with_entries_today_and_another_day
    @today_entries = create_list(:journal_entry, 3, :task,
                                 target_date: Date.today,
                                 journal: @journal)

    @next_month_day_entries = create_list(:journal_entry, 3, :task,
                                 target_date: Date.today + 1.month,
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

  def when_selecting_day_entries_tab
    click_on 'Day Entries'
  end

  def when_selecting_month_entries_tab
    click_on 'Month Entries'
  end

  def user_sees_list_of_month_entries
    @month_entries_october.each do |entry|
      expect(page).to have_text(entry.title)
    end
  end

  def user_sees_list_of_another_day_entries
    @next_month_day_entries.each do |entry|
      expect(page).to have_text(entry.title)
    end
  end

  def user_sees_list_of_another_month_entries
    @month_entries_november.each do |entry|
      expect(page).to have_text(entry.title)
    end
  end

  def when_selecting_different_date
    find('.journal__datepicker-dropdown-toggler').click
    find('.DayPickerNavigation_rightButton__horizontal').click
    within('.CalendarMonth[data-visible=true]') do
      find('td', text: next_month.day.to_s).click
    end
  end
end
