# -*- encoding : ascii-8bit -*-

require 'test_helper'

class UtilsTest < Minitest::Test
  include Ethereum::Utils

  def test_keccak256
    assert_equal "\xc5\xd2F\x01\x86\xf7#<\x92~}\xb2\xdc\xc7\x03\xc0\xe5\x00\xb6S\xca\x82';{\xfa\xd8\x04]\x85\xa4p", keccak256('')
  end

  def test_keccak256_rlp
    assert_equal "V\xe8\x1f\x17\x1b\xccU\xa6\xff\x83E\xe6\x92\xc0\xf8n[H\xe0\x1b\x99l\xad\xc0\x01b/\xb5\xe3c\xb4!", keccak256_rlp('')
    assert_equal "_\xe7\xf9w\xe7\x1d\xba.\xa1\xa6\x8e!\x05{\xee\xbb\x9b\xe2\xac0\xc6A\n\xa3\x8dO?\xbeA\xdc\xff\xd2", keccak256_rlp(1)
    assert_equal "\x1d\xccM\xe8\xde\xc7]z\xab\x85\xb5g\xb6\xcc\xd4\x1a\xd3\x12E\x1b\x94\x8at\x13\xf0\xa1B\xfd@\xd4\x93G", keccak256_rlp([])
    assert_equal "YZ\xef\x85BA8\x89\x08?\x83\x13\x88\xcfv\x10\x0f\xd8a:\x97\xaf\xb8T\xdb#z#PF89", keccak256_rlp([1, [2,3], "4", ["5", [6]]])
  end

  def test_decode_hex
    assert_raises(TypeError) { decode_hex('xxxx') }
    assert_raises(TypeError) { decode_hex("\x00\x00") }
  end

  def test_big_endian_to_int
    assert_equal 255, big_endian_to_int("\xff")
    assert_equal 255, big_endian_to_int("\x00\x00\xff")
  end

end
