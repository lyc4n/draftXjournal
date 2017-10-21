FactoryGirl.define do
  factory :journal_entry, class: 'Journal::Entry' do
    journal nil
    type 1
    status 1
    target_date "2017-10-21"
    title "MyString"
  end
end
