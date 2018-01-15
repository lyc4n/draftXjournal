class Journal::Month < ApplicationRecord
  belongs_to :journal
  has_many   :month_entries, foreign_key: :journal_month_id

  validates :journal, presence: true
  validates :month, numericality: {less_than_or_equal_to: 12, greater_than: 0}
end
