class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :drafts
  has_many :journals
  has_one  :current_year_journal, -> {where(year: DateTime.now.year)}, class_name: 'Journal'

  after_create :generate_current_year_journal

  private

  def generate_current_year_journal
    create_current_year_journal
  end
end
