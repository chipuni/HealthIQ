# Setup comes from https://learnrubythehardway.org/book/ex46.html
require 'optparse'
require 'rake/testtask'

require './lib/bloodsugar.rb'
require './lib/bloodsugar_view.rb'

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

  if ENV['GRAPH'].nil?
    puts 'The graph will be written to result.png. If you want another location'
    puts 'overwrite the GRAPH environment variable.'
    ENV['GRAPH'] = 'result.png'
  end

  bloodsugar = BloodSugar.read_from_files(ENV['FOOD'], ENV['EXERCISE'])
  bloodsugar_view = BloodSugarView.new(bloodsugar)
  bloodsugar_view.output_graph(ENV['GRAPH'])
  bloodsugar_view.output_text
end
