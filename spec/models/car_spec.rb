require 'spec_helper'

describe Car do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Car.create!(@valid_attributes)
  end
end
