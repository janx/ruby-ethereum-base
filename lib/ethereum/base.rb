require 'digest/sha3'
require 'rlp'

module Ethereum
  module Base

    VERSION = "0.1.2"

    autoload :Sedes, 'ethereum/base/sedes'
    autoload :Utils, 'ethereum/base/utils'

  end
end
