require 'helper'

class TestSeverity < MiniTest::Unit::TestCase

  def test_maps_ruby_logger_levels_to_syslog_levels
    GELF::LOGGER_MAPPING.each do |ruby_level, syslog_level|
      refute_equal syslog_level, ruby_level
    end
  end

end
