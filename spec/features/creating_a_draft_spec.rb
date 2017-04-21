require 'rails_helper'

feature 'drafts' do
  let(:user){create(:user)}
  scenario 'user creates a draft' do
    user = create(:user)
    login_as user

    visit '/'
    click_link('Write a draft')
    expect(page).to have_current_path('/drafts/new')
    fill_in('draft_title', with: 'Draft#1')
    fill_in('markdown-editor', with: '**Hello World**')
    click_button 'Save draft'

    expect(page).to have_current_path('/')
    expect(page).to have_selector('.draft-preview-item', count: 1)
    expect(page).to have_selector('.flash--success')
  end


  scenario 'user tries to save draft without content' do
    user = create(:user)
    login_as user

    visit '/'
    click_link('Write a draft')
    expect(page).to have_current_path('/drafts/new')
    fill_in('markdown-editor', with: '')
    click_button 'Save draft'

    expect(page).to have_content('New Draft')
    expect(page).to have_selector('.flash--error')
  end
end
