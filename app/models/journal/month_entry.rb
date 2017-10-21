class Journal::MonthEntry < ApplicationRecord
  belongs_to :month, class_name: 'Journal::Month', foreign_key: 'journal_month_id'

  enum type: {task: 0, event: 1, note: 2}

  validates :title, presence: true
  validates :month, presence: true
  validates :type,  presence: true
end
