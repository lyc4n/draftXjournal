require 'rails_helper'

feature 'drafts' do
  let(:user){create(:user)}
  scenario 'a logged in user creates a draft' do
    user = create(:user)
    login_as user

    visit '/'
    click_link('Write a draft')
    expect(page).to have_current_path('drafts/new')
    fill_in('#markdown-editor', with: '**Hello World**')
    click_button 'Save draft'

    visit '/'
    expect(page).to have_selector('.draft-preview-item', count: 1)
  end
end

# feature: Drafts
# given: Logged in user
#
# when: User creates a draft
# draft shows in home page
