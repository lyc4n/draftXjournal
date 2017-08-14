require 'rails_helper'

RSpec.describe User do
  describe 'Associations' do
    it {is_expected.to have_many(:user_auths)}
    it {is_expected.to have_many(:drafts)}
  end
end
