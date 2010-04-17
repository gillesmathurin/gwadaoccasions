require 'spec_helper'

describe BackgroundTask do
  
  BackgroundTask::Vehicle_Lead = Struct.new(:provider, :vehicle, :leads)
  
  describe ".sends_leads_list_to_providers" do
    before(:each) do
      @provider = Provider.make
      @user = User.make
      @vehicle = Vehicle.make(:provider => @provider, :price => 6000, :kilometrage => 110000)
      @searchprofile = SearchProfile.make(:minprice => 5000, :maxprice => 7000, :minkilometer => 100000,
        :maxkilometer => 120000, :user => @user)
      @association = BackgroundTask::Vehicle_Lead.new(@provider, @vehicle, [@user])
      @results = BackgroundTask.sends_leads_list_to_providers
    end
    
    it "fetches the providers" do
      pending
      @results.should be_kind_of(Array)
      @results.should include(@provider)
    end
        
    it "finds the matching users for each provider vehicles" do
      pending
      @results.should include(@association)
    end
    
    it "sends a list of these matching users associated with each vehicle to each provider" do
      @results = true
    end
  end
  
  describe ".sends_interesting_vehicles" do
    
  end
end
