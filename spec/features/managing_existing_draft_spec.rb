require 'rails_helper'

feature 'Managing existing draft', :js do
  let(:user){create(:user)}
  let(:draft_title){'STI for long term'}
  let!(:draft){create(:draft, user: user, title: draft_title)}

  before do
    login_as user
    visit '/'
    click_on(draft_title)
  end

  scenario 'editing' do
    new_content = '**TUGS WILL BE BULLISH NEXT WEEK**'
    click_on('Edit')
    expect(page.current_path).to eq(edit_draft_path(draft))
    fill_in('draft_title', with: 'TUGS for long term')

    fill_in_editor_field(new_content)
    expect(page).to have_editor_display(text: new_content)
    click_on('Update draft')

    expect(page.current_path).to eq(draft_path(draft))
    expect(page).to have_content(new_content.gsub('*', ''))
    expect(page).to have_content('have been updated')
  end

  scenario 'deleting' do
    page.accept_confirm do
      click_on('Delete')
    end

    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('have been deleted')
  end
end
