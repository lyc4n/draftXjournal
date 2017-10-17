require 'rails_helper'

describe Journal do
  describe 'Associations' do
    it {is_expected.to belong_to :user}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:year)}
    it {is_expected.to validate_presence_of(:user_id)}
    it {is_expected.to validate_presence_of(:status)}
  end
end
