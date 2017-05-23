class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_in user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      redirect_to edit_user_path(current_user)
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
