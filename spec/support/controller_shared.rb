# NOTE:
# Usage: it_behaves_like 'a user page', -> { get :edit }

shared_examples 'a user page' do |action|
  context 'when NO ONE is logged in' do
    before do
      sign_out :user
      instance_exec(&action)
    end

    it 'responds with 302 code' do
      expect(response.code).to eq('302')
    end

    it 'redirects to login page' do
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
