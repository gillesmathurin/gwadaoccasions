require 'spec_helper'

describe Subscription do
  before(:each) do
    @valid_attributes = {
      :plan_id => 1,
      :subscription_date => Time.now,
      :status => "value for status",
      :provider_id => 1,
      :subscriber_id => "value for subscriber_id"
    }
  end

  it "should create a new instance given valid attributes" do
    Subscription.create!(@valid_attributes)
  end
end
