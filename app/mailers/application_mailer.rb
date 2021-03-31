class ApplicationMailer < ActionMailer::Base
<<<<<<< HEAD
  default from: 'turingpractice@gmail.com'
  layout 'mailer'
=======
  default from: 'from@example.com'
  layout 'mailer'

  def registration_confirmation(user)
   @user = user
   mail(:to => "#{user.full_name} <#{user.email}>", :subject => "Registration Confirmation")
  end
>>>>>>> b1af63a35fd283faedf39247c5bcd1e5962d4f75
end
