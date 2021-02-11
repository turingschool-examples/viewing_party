require "rails_helper"

describe "new viewing party page" do
  describe "(happy path)" do
    before do
      @user = User.create(email: "user1@example.com", password: "password123", password_confirmation: "password123")
      @friend1 = User.create(email: "friend1@email.com", password: "password123", password_confirmation: "password123")
      @friend2 = User.create(email: "friend2@email.com", password: "password123", password_confirmation: "password123")

      Follow.create(follower_id: @user.id, followee_id: @friend1.id)
      Follow.create(follower_id: @user.id, followee_id: @friend2.id)

      allow_any_instance_of(ViewingPartiesController).to receive(:current_user).and_return(@user) #stubbing method to simulate being logged in.

      VCR.use_cassette("movie_service_hp_top") do
        @movie = MoviesFacade.find_movies_by_name(nil)[0]
      end

      VCR.use_cassette("movie_service_hp_info") do
        @movie_info = MoviesFacade.get_movie_info(@movie.id)
      end

      VCR.use_cassette("movie_service_hp_info_2") do
        visit new_viewing_party_path(@movie.id)
      end
    end

    it "has proper fields prepopulated" do
      expect(page).to have_content(@movie.title)
    end

    it "has a list of friends to invite" do
      within("#friends") do
        expect(page).to have_content(@friend1.email)
        expect(page).to have_content(@friend1.email)
      end
    end

    it "allows the user to create a viewing party via a form" do
      fill_in :"party[duration]", with: 120
      fill_in :"party[start_time]", with: "7:20 AM"
      fill_in :"party[scheduled_date]", with: "2/2/2020"
      VCR.use_cassette("movie_service_hp_info_2") do
        click_button "Create Party"
      end
      expect(page).to have_content("Successfully created party!")
      expect(current_path).to eq(dashboard_path)
    end
  end
end

describe "new viewing party page" do
  describe "(sad path)" do
    before :each do
      @user = User.create(email: "user1@example.com", password: "password123", password_confirmation: "password123")
      @friend1 = User.create(email: "friend1@email.com", password: "password123", password_confirmation: "password123")
      @friend2 = User.create(email: "friend2@email.com", password: "password123", password_confirmation: "password123")

      Follow.create(follower_id: @user.id, followee_id: @friend1.id)
      Follow.create(follower_id: @user.id, followee_id: @friend2.id)

      allow_any_instance_of(ViewingPartiesController).to receive(:current_user).and_return(@user) #stubbing method to simulate being logged in.

      VCR.use_cassette("movie_service_hp_top") do
        @movie = MoviesFacade.find_movies_by_name(nil)[0]
      end

      VCR.use_cassette("movie_service_hp_info") do
        @movie_info = MoviesFacade.get_movie_info(@movie.id)
      end

      VCR.use_cassette("movie_service_hp_info_2") do
        visit new_viewing_party_path(@movie.id)
      end
    end

    it "renders page with flash message when given invalid input" do
      VCR.use_cassette("movie_service_hp_info_2") do
        click_button "Create Party"
      end
      expect(page).to have_content("Scheduled date can't be blank")
      expect(page).to have_button("Create Party") #check if it is on the same page because current_path will not be the same
    end

    it "redirects user to root page when user is not logged in" do
      allow_any_instance_of(ViewingPartiesController).to receive(:current_user).and_return(nil) #stubbing method to simulate not being logged in.
      VCR.use_cassette("movie_service_hp_info_2") do
        visit new_viewing_party_path(@movie.id)
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in to view this content!")
    end
  end
end
