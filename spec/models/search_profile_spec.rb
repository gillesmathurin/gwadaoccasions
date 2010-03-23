require 'spec_helper'

describe SearchProfile do
  
  before(:each) do
    @valid_attributes = {
      :category => "value for category",
      :minprice => 1,
      :maxprice => 1,
      :minkilometer => 1,
      :maxkilometer => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    SearchProfile.create!(@valid_attributes)
  end
  
  it "is not valid without minprice" do
    profile = SearchProfile.new(:minprice => nil)
    profile.should_not be_valid
  end
  
  it "is not valid without a maxprice" do
    profile = SearchProfile.new(@valid_attributes.except(:minprice, :maxprice))
    profile.should_not be_valid
    profile.should have(1).error_on(:minprice)
    profile.should have(1).error_on(:maxprice)
  end
  
  describe "#search_profile_count - validation" do
    
    context "when the user is under is search profile limit" do
      before(:each) do
        4.times { SearchProfile.create!(@valid_attributes) }
      end
      
      it "allows the creation of a search profile" do
        SearchProfile.create!(@valid_attributes)
        SearchProfile.count.should == 5     
      end
    end
    
    context "when the user has reached is search profile number limit" do
      before(:each) do
        5.times { SearchProfile.create!(@valid_attributes) }
      end
      
      it "prevents the creation of one more search profile" do
        @profile = SearchProfile.create(@valid_attributes)
        SearchProfile.count.should_not == 6
        SearchProfile.count.should == 5
        @profile.should_not be_valid
        @profile.should have(1).error
      end
    end

    
    
  end
end
