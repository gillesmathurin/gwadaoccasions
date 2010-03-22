require 'spec_helper'

describe SearchProfilesHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(SearchProfilesHelper)
  end
  
  describe "#kilometers_criteria(profile)" do
    
    context "profile has kilometers attributes" do
      before(:each) do
        @profile = SearchProfile.make(:minkilometer => 20000, :maxkilometer => 60000)
      end
      
      it "returns '20 000 km' for minkilometer" do
        content = helper.kilometers_criteria(@profile)
        content.should == "kilometrage compris entre : 20 000 km et 60 000 km"
      end
    end
    
    context "profile hasn't got kilometers attributes" do
      before(:each) do
        @profile = SearchProfile.make(:minkilometer => "", :maxkilometer => "")
      end
      
      it "returns nothing" do
        content = helper.kilometers_criteria(@profile)
        content.should == ""
      end
    end
  end
end
