require 'spec_helper'

describe Moto do
  before(:each) do
    @valid_attributes = {
      :annee => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Moto.create!(@valid_attributes)
  end
end
