task_titles = [
  'Build house for Digong the dog', 'Run 100 Km', 'Swim 100 Km', 'Do 1000 pushups',
  'Loose 10lbs', 'Learn a bit of Nihongo', 'Finish reading Tom Sawyer', 'Visit grandparents',
  'Sell unsued phone', 'Plan for Baguio Trip', 'Talk to Gloria', 'Talk to Jade', 'Talk to Jim',
  'Practice christmas songs', 'Make list of gifts to give', 'Repaint the Roof'
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
  factory :journal_month_entry, class: 'Journal::MonthEntry' do
    month      nil
    entry_type 'task'
    title      'Build house for Digong the dog'

    trait :task do
      entry_type 'task'
      title      {task_titles.sample}
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
