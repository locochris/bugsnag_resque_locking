# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks

if ENV['QUEUE']
  Resque::redis = ENV.fetch('RESQUE_URI', 'redis://test:test@pub-redis-16807.us-east-1-4.4.ec2.garantiadata.com:16807')
  require 'resque/tasks'
  task 'resque:setup' => :environment
end
