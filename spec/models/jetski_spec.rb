require 'spec_helper'

describe Jetski do
  before(:each) do
    @valid_attributes = {
      :annee => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Jetski.create!(@valid_attributes)
  end
end
