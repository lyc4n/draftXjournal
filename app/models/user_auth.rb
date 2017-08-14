class UserAuth < ApplicationRecord
  belongs_to :user

  scope :fb, -> {where(provider: 'facebook')}
end
