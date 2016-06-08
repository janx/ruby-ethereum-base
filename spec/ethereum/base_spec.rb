require 'spec_helper'

describe Ethereum::Base do
  it 'has a version number' do
    expect(Ethereum::Base::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
