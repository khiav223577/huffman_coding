# frozen_string_literal: true

require 'test_helper'

class HuffmanCodingTest < Minitest::Test # huffman_coding
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::HuffmanCoding::VERSION # huffman_coding
  end

  def test_encode
    binary, last_byte_bits, mapping = HuffmanCoding.encode('ABCDEFGHH'.each_char)

    if RUBY_VERSION < '2'
      expected_binary = "\355\031p\000"
      expected_mapping = {
        'H' => '000',
        'D' => '001',
        'C' => '010',
        'B' => '011',
        'E' => '100',
        'F' => '101',
        'G' => '110',
        'A' => '111',
      }.freeze
    else
      expected_binary = String.new("\xFA\xC6\x88\x00", :encoding => 'BINARY')
      expected_mapping = {
        'A' => '111',
        'B' => '110',
        'C' => '101',
        'D' => '100',
        'E' => '011',
        'F' => '010',
        'G' => '001',
        'H' => '000',
      }.freeze
    end

    assert_equal expected_binary, binary
    assert_equal 3, last_byte_bits
    assert_equal expected_mapping, mapping

    assert_equal 'ABCDEFGHH', HuffmanCoding.decode(binary, last_byte_bits, mapping)
  end

  def test_encode_when_last_byte_have_8_bits
    binary, last_byte_bits, mapping = HuffmanCoding.encode('A short test.'.each_char)

    if RUBY_VERSION < '2'
      expected_binary = "\024\376\tD\343"
      expected_mapping = {
        'r' => '0000',
        'A' => '0001',
        'e' => '0010',
        '.' => '0011',
        ' ' => '010',
        's' => '011',
        't' => '10',
        'o' => '110',
        'h' => '111',
      }.freeze
    else
      expected_binary = String.new("6\x88BwV", :encoding => 'BINARY')
      expected_mapping = {
        'e' => '111',
        '.' => '110',
        't' => '10',
        ' ' => '011',
        's' => '010',
        'A' => '0011',
        'h' => '0010',
        'o' => '0001',
        'r' => '0000',
      }.freeze
    end

    assert_equal expected_binary, binary
    assert_equal 8, last_byte_bits
    assert_equal expected_mapping, mapping

    assert_equal 'A short test.', HuffmanCoding.decode(binary, last_byte_bits, mapping)
  end

  def test_encode_with_only_one_kind_of_char
    binary, last_byte_bits, mapping = HuffmanCoding.encode('TTT'.each_char)

    if RUBY_VERSION < '2'
      expected_binary = "\000"
      expected_mapping = { 'T' => '0' }.freeze
    else
      expected_binary = String.new("\000", :encoding => 'BINARY')
      expected_mapping = { 'T' => '0' }.freeze
    end

    assert_equal expected_binary, binary
    assert_equal 3, last_byte_bits
    assert_equal expected_mapping, mapping

    assert_equal 'TTT', HuffmanCoding.decode(binary, last_byte_bits, expected_mapping)
  end
end
