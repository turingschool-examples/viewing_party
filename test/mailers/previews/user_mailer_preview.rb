# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def sign_up_email
    user = User.new(first_name: "Betty",
                    last_name: "Doodle",
                    email: "betty@gmail.com",
                    password: 'password',
                    password_confirmation: 'password'
                    )

    UserMailer.with(user: user).sign_up_email
  end
end
