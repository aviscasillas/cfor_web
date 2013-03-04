require 'spec_helper'

describe Formula do
  it { should belong_to(:user) }
end
