class Journal::Month < ApplicationRecord
  belongs_to :journal

  validates :journal, presence: true
  validates :month, numericality: {less_than_or_equal_to: 12, greater_than: 0}
end
