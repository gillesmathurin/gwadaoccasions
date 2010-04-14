require 'spec_helper'

describe "/providers/show" do
  
  def provider(stubs = {})
    @provider ||= Provider.make(stubs)
  end
  
  context "with a pending provider" do
    before(:each) do
      sign_in(provider)
      @plan = mock_model(Plan, :nom => "Standard", :price => 8500)
      @subscription = mock_model(Subscription, :provider_id => provider, :plan_id => nil).as_new_record
      assigns[:provider] = provider
      assigns[:subscription] = @subscription
      assigns[:plans] = [@plan]
      @plan.stub!(:human_price).and_return(85.00)
      render 'providers/show'
    end
    
    it "invites the provider to pay his subscription on paypal" do
      response.should have_selector(".subscribe-block") do |selector|
        selector.should have_selector("h2") do |header|
          header.should contain("Veuillez vérifier les informations de votre profil")
        end
      end
    end
    
    it "display the provider account info" do
      response.should contain("#{provider.contact_name}")
      response.should contain("#{provider.company}")
      response.should contain("#{provider.login}")
      response.should contain("#{provider.email}")
    end
    
    it "shows the subscription form" do
      response.should have_selector("form", :method => "post", :action => subscriptions_path) do |form|
        form.should have_selector("input", :type => "radio", :value => "#{@plan.id}")
        form.should have_selector("input", :type => "submit", :value => "Souscrire")
      end
    end
  end
  
  context "with a active provider" do
    before(:each) do
      sign_in(provider(:status => "active"))
      @plan = Plan.make()
      @subscription = Subscription.make(:provider => @provider, :plan => @plan)
      assigns[:provider] = @provider
      assigns[:subscription]
      @plan.stub!(:human_price).and_return(85.00)
      render 'providers/show'
    end
    
    it "shows and Invoice History link" do
      response.should contain("Historique des factures")
    end
  end
end
