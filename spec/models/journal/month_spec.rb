require 'rails_helper'

RSpec.describe Journal::Month do
  describe 'Associations' do
    it {is_expected.to belong_to :journal}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of(:journal)}

    it do
      is_expected.to validate_numericality_of(:month).
        is_less_than_or_equal_to(12).
        is_greater_than(0)
    end
  end
end
