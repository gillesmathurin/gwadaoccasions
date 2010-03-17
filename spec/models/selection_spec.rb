require 'spec_helper'

describe Selection do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :vehicle_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Selection.create!(@valid_attributes)
  end
end
