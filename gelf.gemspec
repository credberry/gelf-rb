# -*- encoding: utf-8 -*-
require './lib/gelf/version'

Gem::Specification.new do |s|
  s.name    = 'gelf'
  s.version = GELF::VERSION

  s.summary     = 'Library to send GELF messages to Graylog2 logging server'
  s.description =<<-EOS
Library to send GELF messages to Graylog2 logging server.
Supports plain-text, GELF messages and exceptions.
  EOS

  s.authors  = ['Mark Rada', 'Alexey Palazhchenko', 'Lennart Koopmann']
  s.email    = 'mrada@marketcircle.com'
  s.homepage = "http://github.com/Marketcircle/gelf-rb"
  s.licenses = ['MIT']
  s.has_rdoc = 'yard'

  s.files = [
    '.gemtest',
    '.travis.yml',
    'CHANGELOG',
    'LICENSE',
    'README.markdown',
    'Rakefile',
    'benchmarks/notifier.rb',
    'lib/gelf.rb',
    'lib/gelf/logger.rb',
    'lib/gelf/notifier.rb',
    'lib/gelf/ruby_sender.rb',
    'lib/gelf/severity.rb',
    'lib/gelf/version.rb'
  ]
  s.test_files = [
    'test/helper.rb',
    'test/test_logger.rb',
    'test/test_notifier.rb',
    'test/test_ruby_sender.rb',
    'test/test_severity.rb'
  ]
end

