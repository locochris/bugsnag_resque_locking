# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

if ENV['QUEUE']
  require 'bugsnag'
  require File.expand_path('../config/initializers/bugsnag', __FILE__)

  require 'resque'
  Resque::redis = ENV.fetch('RESQUE_URI', 'redis://test:test@pub-redis-16807.us-east-1-4.4.ec2.garantiadata.com:16807')
  require 'resque/tasks'
  require File.expand_path('../app/workers/task.rb', __FILE__)
else
  require File.expand_path('../config/application', __FILE__)
  Rails.application.load_tasks
end
