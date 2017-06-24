require 'rails_helper'

feature 'Viewing Home Page', js: true do
  context 'when logged in' do
    let(:user){create(:user, :with_drafts, number_of_drafts: 2)}

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
      expect(page).to have_selector('.draft-list-item', count: 2)
    end

    it 'adds has a link to the NEW DRAFT form' do
      expect(page).to have_content('New draft')
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
