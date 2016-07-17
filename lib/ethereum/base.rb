require 'digest/sha3'
require 'rlp'

module Ethereum
  module Base

    BYTE_ZERO = "\x00".freeze
    GTXCOST = 21000       # TX BASE GAS COST
    GTXDATANONZERO = 68   # TX DATA NON ZERO BYTE GAS COST
    GTXDATAZERO = 4       # TX DATA ZERO BYTE GAS COST
    SECP256K1_N = 115792089237316195423570985008687907852837564279074904382605163141518161494337
    UINT_MAX = 2**256 - 1

    autoload :Sedes, 'ethereum/base/sedes'
    autoload :Utils, 'ethereum/base/utils'

    class ValidationError < StandardError; end
    class InvalidTransaction < ValidationError; end

  end
end
