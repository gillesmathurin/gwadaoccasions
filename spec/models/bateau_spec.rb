require 'spec_helper'

describe Bateau do
  before(:each) do
    @valid_attributes = {
      :annee => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Bateau.create!(@valid_attributes)
  end
end
