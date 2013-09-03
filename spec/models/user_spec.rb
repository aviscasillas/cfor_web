require 'spec_helper'

describe User do
  it { should have_many(:formulas).with_dependent(:destroy) }
end
