FactoryGirl.define do
  factory :journal_month_entry, class: 'Journal::MonthEntry' do
    month nil
    type  'task'
    title 'Build house for Digong the dog'
  end
end
