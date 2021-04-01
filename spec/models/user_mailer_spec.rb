require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'sending confirmation emails' do
    before :each do
      @user = create(:user, full_name: 'Andrew Johnston', password: 'password')
      @mail = UserMailer.registration_confirmation(@user).deliver_now
    end

    it 'renders the headers' do
      expect(@mail.subject).to eq('Registration Confirmation')
      expect(@mail.to).to eq([@user.email])
      expect(@mail.from).to eq(['turingpractice@gmail.com'])
      expect(@mail.reply_to).to eq(nil)
    end

    it 'renders the body' do
      expect(@mail.text_part.body.to_s).to include("Hi #{@user.full_name}")
      expect(@mail.text_part.body.to_s).to include("Thanks for registering for Viewing Party! To confirm you registration click the URL:")

      expect(@mail.html_part.body.to_s).to include("Hi #{@user.full_name}")
      expect(@mail.html_part.body.to_s).to include("Thanks for registering for Viewing Party! To confirm you registration click the URL:")
      expect(@mail.html_part.body.to_s).to include("Confirm Registration")

      expect(@mail.body.encoded).to include("Hi #{@user.full_name}")
      expect(@mail.body.encoded).to include("Thanks for registering for Viewing Party! To confirm you registration click the URL:")

      expect(@mail.html_part.body).to include("http://turingpractice@gmail.com/users/#{@user.id}/confirm_email")
    end
  end
end
