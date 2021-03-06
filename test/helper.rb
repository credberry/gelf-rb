require 'rubygems'
require 'simplecov'
require 'minitest/autorun'
require 'test/unit'
require 'shoulda'
require 'mocha/setup'
require 'coveralls'

Coveralls.wear!

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'gelf'

class MiniTest::Unit::TestCase
end
