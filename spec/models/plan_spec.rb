require 'spec_helper'

describe Plan do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :price => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Plan.create!(@valid_attributes)
  end
end
