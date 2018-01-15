class Journal::Entry < ApplicationRecord
  belongs_to :journal

  enum entry_type: {task: 0, event: 1, note: 2}
  enum status: {untouched: 0, done: 1}

  validates :title, presence: true
  validates :target_date, presence: true
  validates :entry_type, presence: true
  validates :status, presence: true

  scope :on_day, ->(target_date) { where(target_date: target_date)}
end
