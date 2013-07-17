require 'simplecov-rcov'

SimpleCov.start do
  coverage_dir 'ci/coverage'

  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter,
  ]

  add_filter 'test/'
end
