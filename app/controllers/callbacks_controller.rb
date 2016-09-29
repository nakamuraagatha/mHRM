class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def office365
    logger.warn 'OFFICE check'
    session["omniauth.state"] = params['state']
    @user = User.from_omniauth(request.env["omniauth.auth"])
    logger.warn 'OFFICE CREATE OR UPDATE USER'
    sign_in_and_redirect @user
  end
end
