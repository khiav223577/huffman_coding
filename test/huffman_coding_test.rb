require 'test_helper'

class HuffmanCodingTest < Minitest::Test # huffman_coding
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::HuffmanCoding::VERSION # huffman_coding
  end

  def test_encode
    binary, last_byte_bits, mapping = HuffmanCoding.encode('A short test.'.each_char)

    assert_equal "6\x88BwV", binary
    assert_equal 0, last_byte_bits

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
    assert_equal expected_mapping, mapping

    assert_equal 'A short test.', HuffmanCoding.decode(binary, last_byte_bits, expected_mapping)
  end

  def test_encode_with_only_one_kind_of_char
    binary, last_byte_bits, mapping = HuffmanCoding.encode('TTT'.each_char)

    assert_equal "\x00", binary
    assert_equal 3, last_byte_bits

    expected_mapping = { 'T' => '0' }.freeze
    assert_equal expected_mapping, mapping

    assert_equal 'TTT', HuffmanCoding.decode(binary, last_byte_bits, expected_mapping)
  end
end

