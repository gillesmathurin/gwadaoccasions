require 'spec_helper'

describe SearchProfile do
  before(:each) do
    @valid_attributes = {
      :category => "value for category",
      :minprice => 1,
      :maxprice => 1,
      :minkilometer => 1,
      :maxkilometer => 1
    }
  end

  it "should create a new instance given valid attributes" do
    SearchProfile.create!(@valid_attributes)
  end
end
