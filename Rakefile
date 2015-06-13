require File.expand_path('../config/env', __FILE__)


desc "run console"
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'

  exec "pry -r ./config/env.rb"
end
