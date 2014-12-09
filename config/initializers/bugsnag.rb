Bugsnag.configure do |config|
  config.api_key = ENV.fetch('BUGSNAG_API_KEY')
  config.release_stage = 'development'
  config.notify_release_stages = ['development']
  config.debug = true
end
