class Journal::Entry < ApplicationRecord
  belongs_to :journal

  enum type: {task: 0, event: 1, note: 2}
  enum status: {untouched: 0, done: 1}

  validates :title, presence: true
  validates :target_date, presence: true
  validates :type, presence: true
  validates :status, presence: true
end
