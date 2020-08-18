Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['62868422183-mcitplkv4usrjks0t02h67q69oeh7hlu.apps.googleusercontent.com'], ENV['8e3l4ASA5L_sS5-QV6q0oAdV'],{
    scope: 'userinfo.email, userinfo.profile, userinfo.calender',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50
  }
end


# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
# end
