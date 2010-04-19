require 'spec_helper'

describe Faq do
  before(:each) do
    @valid_attributes = {
      :question => "value for question",
      :answer => "value for answer"
    }
  end

  it "should create a new instance given valid attributes" do
    Faq.create!(@valid_attributes)
  end
end
