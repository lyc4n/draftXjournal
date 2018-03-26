json.contextDate  journal.date.strftime
json.journal      journal.journal
json.dayEntries   journal.day_entries, partial: 'journals/entry', as: :entry
json.monthEntries journal.month_entries, partial: 'journals/entry', as: :entry
