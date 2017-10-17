class Journal < ApplicationRecord

  enum status: [:inactive, :active]

  belongs_to :user

  validates :user_id, presence: true
  validates :year, presence: true
  validates :status, presence: true, inclusion: {in: statuses.values}
end
