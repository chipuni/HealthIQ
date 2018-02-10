# Setup comes from https://learnrubythehardway.org/book/ex46.html
require 'optparse'
require 'rake/testtask'

require './lib/health_iq.rb'

Rake::TestTask.new do |t|
  t.libs << 'tests'
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

task :install do
  system('bundle install')
end

task simulator: %i[install] do
  # According to http://cobwwweb.com/4-ways-to-pass-arguments-to-a-rake-task
  # the easiest way to pass information into Ruby via rake is through
  # environment variables.
  if ENV['EXERCISE'].nil?
    puts 'Please set the EXERCISE environment variable.'
    exit(1)
  end

  if ENV['FOOD'].nil?
    puts 'Please set the FOOD environment variable.'
    exit(1)
  end

  health_iq = HealthIQ.new(ENV['FOOD'], ENV['EXERCISE'])
  health_iq.output
end
