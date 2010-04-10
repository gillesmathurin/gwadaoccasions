require 'spec_helper'

describe "/providers/show" do
  
  def provider(stubs = {})
    @provider ||= Provider.make(stubs)
  end
  
  context "with a pending provider" do
    before(:each) do
      sign_in(provider)
      assigns[:provider] = provider
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
    
    it "shows the subscription plan choose by the provider" do
      response.should have_selector(".abonnement") do |selector|
        selector.should contain("Abonnement Standard : 85 € TTC / mois")
      end
    end
  end
  



end
