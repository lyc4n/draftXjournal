require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it {is_expected.to have_many :drafts}
    it {is_expected.to have_many :journals}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:email)}
  end
end
