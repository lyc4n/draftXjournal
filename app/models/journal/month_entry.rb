class Journal::MonthEntry < ApplicationRecord
  belongs_to :month, class_name: 'Journal::Month', foreign_key: 'journal_month_id'

  enum entry_type: {task: 0, event: 1, note: 2}

  scope :on_month, -> (month) { joins(:month).where('journal_months.month = ?', month) }

  validates :title, presence: true
  validates :month, presence: true
  validates :entry_type,  presence: true
end
