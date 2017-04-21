require 'rails_helper'

feature 'Logging in' do
  scenario 'when successful' do
    user = create(:user)
    visit '/'
    expect(page).to have_current_path(new_user_session_path)
    fill_in('Email',    :with => user.email)
    fill_in('Password', :with => 'password')
    click_button('Log in')

    expect(page).to have_current_path('/')
    expect(page).to have_content('Your Drafts')
  end

  scenario 'when unsuccessful' do
    visit '/'
    fill_in('Email',    :with => 'invalid_user@example.com')
    fill_in('Password', :with => 'invalidpassword')

    expect(page).to have_current_path(new_user_session_path)
  end
end
