# Setup comes from https://learnrubythehardway.org/book/ex46.html

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'tests'
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end

task :install do
  system('bundle install')
end

task default: %i[install test] do
  # Run the code.
end
