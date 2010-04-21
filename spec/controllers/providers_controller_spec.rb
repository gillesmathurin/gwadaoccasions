require 'spec_helper'

describe ProvidersController do
  
  def provider(stubs = {})
    @provider ||= Provider.make(stubs)
  end

  describe "GET 'show'" do
    
    context "with a provider logged_in" do
      before(:each) do
        sign_in(provider)
        controller.stub!(:current_provider).and_return(provider)
        provider.stub!(:build_subscription)
      end
      
      it "should be successful" do
        controller.should_receive(:current_provider).and_return(provider)
        get 'show'
        response.should be_success
      end
      
      it "assigns the current provider as @provider" do
        provider.should_receive(:build_subscription)
        get 'show'
        assigns[:provider].should == provider
      end
    end

  end
end
