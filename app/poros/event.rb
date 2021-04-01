class Event 
  attr_reader :title,
              :image,
              :date, 
              :time,
              :friends

  def initialize(api, party)
    @title = api[:original_title]
    @image = api[:poster_path]
    @date = party.date
    @time = party.time 
    @friends = find_user_email(party.guest_lists)
  end

  def find_user_email(party)
    party.joins(:user).select("users.email")
  end
end