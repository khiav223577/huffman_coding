require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'huffman_coding'
require 'lib/patches'

require 'minitest/autorun'
