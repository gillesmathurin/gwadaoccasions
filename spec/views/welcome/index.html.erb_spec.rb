require 'spec_helper'

describe "/welcome/index" do
  
  context "with vehicles in the database" do
    before(:each) do
      assigns[:vehicle_number] = 1
    end
    
    it "displays the number of vehicles available" do
      render
      response.should contain("1 offre")
    end
  end
  
  context "with an empty database" do
    before(:each) do
      assigns[:vehicle_number] = 0
      assigns[:user_number] = 0
    end
    
    it "display a 0 offres message" do
      render
      response.should have_selector(".database_state")
      response.should contain("0 offre(s)")
    end
    
    it "display a 0 compte visiteur message" do
      render
      response.should have_selector(".database_state")
      response.should contain("0 compte(s) visiteur")
    end
  end
end
