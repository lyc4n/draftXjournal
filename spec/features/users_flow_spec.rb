require 'rails_helper'

RSpec.describe 'Users flow' do

  context 'when logged in' do
    let(:user){build_stubbed(:user, :with_stubbed_drafts, number_of_drafts: 2)}
    let!(:another_user){build_stubbed(:user, :with_stubbed_drafts, number_of_drafts: 1)}

    before do
      allow(user).to receive(:save)
      login_as user
      visit '/'
    end

    it 'initially shows the drafts listing' do
      expect(current_path).to eq '/'
      expect(page).to have_content 'Your Drafts'
    end

    it 'displays preview of the login user\'s draft' do
      expect(page).to have_selector('.draft-preview-item', count: 2)
    end
  end

  context 'when user is NOT logged in' do
    before{logout :user}

    it 'shows a login page' do
      visit '/'
      expect(page).to have_selector('.user-session-form')
    end
  end
end
