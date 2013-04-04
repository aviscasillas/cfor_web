require 'spec_helper'

describe Formula do

  it "has a valid factory" do 
  	FactoryGirl.create(:formula).should be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:expression) }
  it { should belong_to(:user) }
end
