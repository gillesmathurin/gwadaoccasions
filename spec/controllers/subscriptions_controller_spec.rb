require 'spec_helper'

describe SubscriptionsController do
  
  def provider
    @provider ||= Provider.make
  end

  describe "GET 'new'" do
    
    before(:each) do
      sign_in(provider)
    end
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
