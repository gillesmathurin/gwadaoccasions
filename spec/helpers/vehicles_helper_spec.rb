require 'spec_helper'

describe VehiclesHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(VehiclesHelper)
  end
  
  describe "#vehicle_title(vehicle)" do
    context "when vehicle is a car" do
      it "displays the modele, year and the price of the vehicle" do
        vehicle = Voiture.make(:modele => "Peugeot 206", :annee => 5.years.ago, :price => 6000)
        content = helper.vehicle_title(vehicle)
        content.should_not be_nil
        content.should == "Peugeot 206 - Année : 2005 - 6000 €"
      end
    end
    
    context "when vehicle is a Motorbike"do
      it "displays the modele, cylindree, year and price" do
        vehicle = Moto.make(:modele => "Yamaha 1525", :cylindree => "750", :annee => 5.years.ago, :price => 6000)
        content = helper.vehicle_title(vehicle)
        content.should_not be_nil
        content.should == "Yamaha 1525 - 750 cm3 - Année : 2005 - 6000 €"
      end      
    end
    
    context "when vehicle is a Jetski" do
      it "displays the modele, year and price" do
      vehicle = Jetski.make(:modele => "Yamaha 1525", :annee => 5.years.ago, :price => 6000)
      content = helper.vehicle_title(vehicle)
      content.should == "Yamaha 1525 - Année : 2005 - 6000 €"        
      end
    end
    
    context "when vehicle is a Boat" do
      it "displays the modele and the price" do
        vehicle = Bateau.make(:modele => "Yamaha 1525", :price => 6000)
        content = helper.vehicle_title(vehicle)
        content.should == "Yamaha 1525 - 6000 €"
      end
    end
  end
end
