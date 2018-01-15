require 'rails_helper'

RSpec.describe JournalsController do
  before do
    sign_in create(:user)
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
