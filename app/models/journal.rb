class Journal < ApplicationRecord

  enum status: {inactive: 0, active: 1}

  belongs_to :user
  has_many   :months

  validates :user, presence: true
  validates :year, presence: true, uniqueness: {scope: :user_id}
  validates :status, presence: true, inclusion: {in: statuses.values + statuses.keys}

  after_create :generate_months


  private

  def generate_months
    months = (1..12).inject([]){|all, month| all << {month: month, journal: self} }
    Journal::Month.create!(months)
  end
end
