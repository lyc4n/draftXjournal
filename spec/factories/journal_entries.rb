task_titles = [
  'Build house for Digong the dog', 'Run 100 Km', 'Swim 0.5 Km', 'Do 50 pushups',
  'Study Nihongo for an hour', 'Read Chapter 5 of Tom Sawyer',
  'Sell unsued phone on OLX', 'Look for cheap place to stay in Baguio',
  'Invite Gloria to lunch', 'Invite Jade to lunch', 'Invite Joe to lunch',
  'Gather christmas song lyrics', 'Buy paint for the roof'
]

event_titles = [
  "Jai's Christening", "Parent's anniv", 'Field Trip', 'Bill Payment',
  'Block Party', 'Sinulog', 'Panagbenga', 'Her birthday'
]

note_titles = [
  'Been 3 months since I started practicing the guitar',
  'This month is gonna be great',
  'Time flows like the river',
  'Code is <3',
  'Ruby is <3',
  'Implicit > Explicit',
  'If it quacks like a duck then it probably is a duck',
]

FactoryGirl.define do
  factory :journal_entry, class: 'Journal::Entry' do
    journal nil
    entry_type 'task'
    status 1
    target_date "2017-10-21"
    title "MyString"

    trait :task do
      entry_type  'task'
      title       {task_titles.sample}
    end

    trait :event do
      entry_type 'event'
      title      {event_titles.sample}
    end

    trait :note do
      entry_type 'note'
      title      {note_titles.sample}
    end
  end
end
