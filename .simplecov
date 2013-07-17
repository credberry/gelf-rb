require 'simplecov-rcov'
require 'coveralls'

SimpleCov.start do
  coverage_dir 'ci/coverage'

  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  add_filter 'test/'
end
