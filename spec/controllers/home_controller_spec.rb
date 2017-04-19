require 'rails_helper'

describe HomeController do
  context 'when user is NOT logged in' do
    before do
      ensure_no_logged_in_user
      get :show
    end
  end

  context 'when user is logged in' do
    before do
      stub_login_user
      get :show
    end

    it 'renders the show page' do
      expect(response).to render_template('show')
    end

    it 'assigns a @home instance variable correctly' do
      expect(assigns(:home)).to_not be_nil
      expect(assigns(:home)).to be_kind_of(Home)
    end
  end
end
