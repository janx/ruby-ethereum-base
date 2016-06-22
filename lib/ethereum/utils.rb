module Ethereum
  module Utils

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

  end
end
