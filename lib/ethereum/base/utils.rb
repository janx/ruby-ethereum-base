module Ethereum::Base
  module Utils

    def sha256(x)
      Digest::SHA256.digest x
    end

    def keccak256(x)
      Digest::SHA3.new(256).digest(x)
    end

    def keccak512(x)
      Digest::SHA3.new(512).digest(x)
    end

    def keccak256_rlp(x)
      keccak256 RLP.encode(x)
    end

    def encode_hex(b)
      RLP::Utils.encode_hex b
    end

    def decode_hex(s)
      RLP::Utils.decode_hex s
    end

    def big_endian_to_int(s)
      RLP::Sedes.big_endian_int.deserialize s.sub(/\A(\x00)+/, '')
    end

    def int_to_big_endian(n)
      RLP::Sedes.big_endian_int.serialize n
    end

    def remove_0x_head(s)
      s[0,2] == '0x' ? s[2..-1] : s
    end

    def normalize_hex_without_prefix(s)
      if s[0,2] == '0x'
        (s.size % 2 == 1 ? '0' : '') + s[2..-1]
      else
        s
      end
    end

    def ripemd160(x)
      Digest::RMD160.digest x
    end

    def hash160(x)
      ripemd160 sha256(x)
    end

    def hash160_hex(x)
      encode_hex hash160(x)
    end

    def ceil32(x)
      x % 32 == 0 ? x : (x + 32 - x%32)
    end

    def zpad(x, l)
      lpad x, BYTE_ZERO, l
    end

    def zunpad(x)
      x.sub /\A\x00+/, ''
    end

    def zpad_int(n, l=32)
      zpad encode_int(n), l
    end

    def zpad_hex(s, l=32)
      zpad decode_hex(s), l
    end

    def int_to_addr(x)
      zpad_int x, 20
    end

    def encode_int(n)
      unless n.is_a?(Integer) && n >= 0 && n <= UINT256_MAX
        raise ArgumentError, "Integer invalid or out of range: #{n}"
      end

      int_to_big_endian n
    end

    def decode_int(v)
      if v.size > 0 && (v[0] == BYTE_ZERO || v[0] == 0)
        raise ArgumentError, "No leading zero bytes allowed for integers"
      end

      big_endian_to_int v
    end

    def bytearray_to_int(arr)
      o = 0
      arr.each {|x| o = (o << 8) + x }
      o
    end

    def int_array_to_bytes(arr)
      arr.pack('C*')
    end

    def bytes_to_int_array(bytes)
      bytes.unpack('C*')
    end

    def coerce_to_int(x)
      if x.is_a?(Numeric)
        x
      elsif x.size == 40
        big_endian_to_int decode_hex(x)
      else
        big_endian_to_int x
      end
    end

    def coerce_to_bytes(x)
      if x.is_a?(Numeric)
        int_to_big_endian x
      elsif x.size == 40
        decode_hex(x)
      else
        x
      end
    end

    def coerce_addr_to_hex(x)
      if x.is_a?(Numeric)
        encode_hex zpad(int_to_big_endian(x), 20)
      elsif x.size == 40 || x.size == 0
        x
      else
        encode_hex zpad(x, 20)[-20..-1]
      end
    end

    def lpad(x, symbol, l)
      return x if x.size >= l
      symbol * (l - x.size) + x
    end

  end
end
