require 'rails_helper'

include Warden::Test::Helpers

RSpec.describe 'Users flow' do

  let(:user){FactoryGirl.build(:user)}

  context 'when logged in' do
    before{login_as user}
    it 'initially shows the drafts listing' do
      visit '/'
      expect(current_path).to eq '/'
    end
  end

  context 'when log logged in' do
    it 'shows a login page' do
      visit '/'
      expect(page).to have_selector('.user-session-form')
    end
  end
end
