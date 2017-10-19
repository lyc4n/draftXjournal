FactoryGirl.define do
  factory :journal_month, class: 'Journal::Month' do
    journal nil
    month 1
  end
end
