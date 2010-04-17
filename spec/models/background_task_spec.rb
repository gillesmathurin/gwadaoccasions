require 'spec_helper'

describe BackgroundTask do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    BackgroundTask.create!(@valid_attributes)
  end
end
