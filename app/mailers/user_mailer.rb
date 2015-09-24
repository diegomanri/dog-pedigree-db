class UserMailer < ApplicationMailer

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.ufname} <#{user.uemail}>", :subject => "DogSpace Registration Confirmation")
  end

end