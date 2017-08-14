class UserAuthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env['omniauth.auth']
    user_auth = UserAuth.find_or_initialize_by(provider: auth.provider, uid: auth.uid, user: current_user)
    user_auth.token = auth.credentials.token
    user_auth.save

    redirect_to fb_posts_path
  end
end
