class UserMailer < ApplicationMailer
  def welcome_email(user, password= nil)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Welcome to mHRM')
  end

  def account_activated(user)
    @user = user
    mail(to: @user.email, subject: 'Account activated')
  end
end
