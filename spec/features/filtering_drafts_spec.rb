require 'rails_helper'

feature 'filtering drafts', js: true do
  let!(:user){create(:user)}
  let!(:drafts){
    [
      create(:draft, title: 'San Miguel', user: user),
      create(:draft, title: 'Talk n Text', user: user)
    ]
  }

  scenario 'user sees results of the filter' do
    login_as user

    visit '/'
    expect(page).to have_selector('.draft-list-item', count: 2)

    expect(page).to have_selector('.draft-filter__field')
    fill_in('draft-filter__field', with: 'San')

    expect(page).to have_selector('.draft-list-item', count: 1)
    expect(page).to have_text('San Miguel')
    expect(page).to_not have_text('Talk n Text')
  end
end
