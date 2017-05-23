class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
    # TODO: do NOT redirect to edit_user if we already have a school!
    if user.persisted?
      sign_in user, event: :authentication
      if current_user.school_id
        flash[:notice] = "Login successfull" if is_navigational_format?
        redirect_to root_path
      else
        flash[:alert] = "Welcome! Please chose your school" if is_navigational_format?
        redirect_to edit_user_path(current_user)
      end
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
