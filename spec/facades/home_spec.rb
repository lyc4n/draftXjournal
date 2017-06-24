require 'rails_helper'

describe Home do
  let(:user){create(:user, :with_drafts, number_of_drafts: 2)}
  let(:home){Home.new(user)}

  describe '#drafts' do
    it 'stores all the drafts of the user' do
      expect(home.drafts).to eq(user.drafts)
    end
  end
end
