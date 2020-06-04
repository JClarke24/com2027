Rails.application.config.middleware.use OmniAuth::Builder do

provider :google_oauth2, ENV["1031056337305-3m51ueucr39hrllm5n3m0g7u7o49mvc4.apps.googleusercontent.com"], ENV["OTTT_ZSsn7-Jii3vjlOu7npP"],
  select_account: true, scope: 'userinfo.email, calendar', access_type: 'online'

end
