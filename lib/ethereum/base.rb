require 'digest/sha3'
require 'rlp'

module Ethereum
  module Base

    BYTE_ZERO = "\x00".freeze
    UINT256_MAX = 2**256 - 1

    autoload :Gas, 'ethereum/base/gas'
    autoload :Secp256K1, 'ethereum/base/secp256k1'
    autoload :Sedes, 'ethereum/base/sedes'
    autoload :Utils, 'ethereum/base/utils'

    class ValidationError < StandardError; end
    class InvalidTransaction < ValidationError; end

  end
end
