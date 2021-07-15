require 'rails_helper'

RSpec.describe InviteMailer do
  describe 'invite' do
    before :each do
      @user = User.create(email: 'test@turing.org', password: 'tester')
      @party = create(:movie_party)
      @host = @party.user
    end
    let(:mail) { InviteMailer.invite_email({ host: @host, party: @party, user: @user}) }

    it "renders the headers" do
      expect(mail.subject).to eq("You've been invited to a movie party!")
      expect(mail.to).to eq(["test@turing.org"])
      expect(mail.from).to eq(["party.viewer.turing@google.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded.include?("You've been invited to watch a movie, test@turing.org")).to eq(true)
    end
  end
end
