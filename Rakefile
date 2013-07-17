task :default => :test

begin
  require 'ci/reporter/rake/test_unit'
rescue LoadError
  # nothing
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'yard'
  Yard::RakeTask.new
rescue LoadError
end

