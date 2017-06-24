require 'rails_helper'

feature 'drafts', js: true do
  let(:user){create(:user)}
  scenario 'user creates a draft' do
    user = create(:user)
    login_as user

    visit '/'
    click_link('New draft')
    expect(page).to have_current_path('/drafts/new')

    expect(page).to have_selector('.editor-toolbar')
    expect(page).to have_selector('.CodeMirror')

    fill_in('draft_title', with: 'Draft#1')
    fill_in_editor_field('**Hello World**')
    expect(page).to have_editor_display text: 'Hello World'
    click_button 'Save draft'

    expect(page).to have_current_path('/')
    expect(page).to have_selector('.flash--success')
    expect(page).to have_selector('.draft-list-item', count: 1)
  end


  scenario 'user tries to save draft without content' do
    user = create(:user)
    login_as user

    visit '/'
    click_link('New draft')
    expect(page).to have_current_path('/drafts/new')

    expect(page).to have_selector('.editor-toolbar')
    expect(page).to have_selector('.CodeMirror')

    fill_in_editor_field('')
    expect(page).to have_editor_display text: ''
    click_button 'Save draft'

    expect(page).to have_content('New Draft')
    expect(page).to have_selector('.flash--error')
  end

  def fill_in_editor_field(text)
    within ".CodeMirror" do
      current_scope.click
      field = current_scope.find("textarea", visible: false)
      field.send_keys text
    end
  end

  def have_editor_display(options)
    editor_display_locator = ".CodeMirror-code"
    have_css(editor_display_locator, options)
  end
end
