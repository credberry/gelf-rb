#! /usr/bin/env ruby

require 'benchmark'
require 'rubygems'
require 'securerandom'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'gelf'

puts "Generating random data..."
k3_message = SecureRandom.urlsafe_base64(3*1024)

TARGET_HOST = 'localhost'
TARGET_PORT = 12201
DEFAULT_OPTIONS = { '_host' => 'localhost' }
TIMES = 5000

SHORT_HASH = { 'short_message' => 'message' }
LONG_HASH  = { 'short_message' => 'message', 'long_message' => k3_message }


notifier_lan = GELF::Notifier.new(TARGET_HOST, TARGET_PORT, 'LAN', DEFAULT_OPTIONS)
notifier_wan = GELF::Notifier.new(TARGET_HOST, TARGET_PORT, 'WAN', DEFAULT_OPTIONS)

# to create mongo collections, etc.
notifier_lan.notify!(LONG_HASH)
sleep(5)

puts "Sending #{TIMES} notifications...\n"
tms = Benchmark.bm(25) do |b|
  b.report('lan, short data, 1 chunk ') { TIMES.times { notifier_lan.notify!(SHORT_HASH) } }
  sleep(5)
  b.report('lan,  long data, 1 chunk ') { TIMES.times { notifier_lan.notify!(LONG_HASH) } }
  sleep(5)
  b.report('wan,  long data, 2 chunks') { TIMES.times { notifier_wan.notify!(LONG_HASH) } }
end
