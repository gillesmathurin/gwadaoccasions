require 'spec_helper'

describe Admin do
  before(:each) do
    @valid_attributes = {}
  end
  
  describe "#verify_count" do
    before(:each) do
      @admin = Admin.create!(:email => "login@foobar.com", :password => "password", :password_confirmation => "password")
    end
    
    it "prevents the creation of another admin record" do
      Admin.create(:email => "login2@foobar.com", :password => "password2", :password_confirmation => "password2")
      Admin.count.should == 1
    end
  end  
end