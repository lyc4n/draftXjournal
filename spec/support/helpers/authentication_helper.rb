module AuthenticationHelper
  def stub_login_user(user = double('user'))
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  def ensure_no_logged_in_user
    sign_out :user
  end
end
