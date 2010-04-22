require 'spec_helper'

describe VehiclesHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(VehiclesHelper)
  end
  
  describe "#vehicle_info(vehicle)" do
    
    context "when vehicle is a car" do
      it "displays the modele, year and the price of the vehicle" do
        vehicle = Voiture.make(:modele => "Peugeot 206", :annee => 5.years.ago, :price => 6000)
        helper.stub(:format_km)
        content = helper.vehicle_info(vehicle)
        content.should_not be_nil
        content.should == "<p><span class=\"modele\">Peugeot 206</span></p><p>Année : 2005</p><p><span class=\"prix\">6000 €</span></p><p><span class=\"km\"></span></p><p>--- \n- Diesel\n- Diesel\n - Boite --- \n- Automatique\n- Automatique\n</p><p>Immatriculation : bhC89B5F</p>"
      end
    end
    
    context "when vehicle is a Motorbike"do
      it "displays the modele, cylindree, year and price" do
        vehicle = Moto.make(:modele => "Yamaha 1525", :cylindree => "750", :annee => 5.years.ago, :price => 6000)
        helper.stub(:format_km)
        content = helper.vehicle_info(vehicle)
        content.should_not be_nil
        content.should == "<p><span class=\"modele\">Yamaha 1525</span></p><p>Cylindrée : 750 cm3</p><p>Année : 2005</p><p><span class=\"prix\">6000 €</span></p><p><span class=\"km\"></span></p><p> - Boite --- \n- Automatique\n- Automatique\n</p><p>Immatriculation : bhC89B5F</p>"
      end      
    end
    
    context "when vehicle is a Jetski" do
      it "displays the modele, year and price" do
      vehicle = Jetski.make(:modele => "Yamaha 1525", :annee => 5.years.ago, :price => 6000)
      content = helper.vehicle_info(vehicle)
      content.should == "<p><span class=\"modele\">Yamaha 1525</span></p><p>Année : 2005</p><p><span class=\"prix\">6000 €</span></p>"        
      end
    end
    
    context "when vehicle is a Boat" do
      it "displays the modele and the price" do
        vehicle = Bateau.make(:modele => "Yamaha 1525", :price => 6000)
        content = helper.vehicle_info(vehicle)
        content.should == "<p><span class=\"modele\">Yamaha 1525</span></p><p><span class=\"prix\">6000 €</span></p>"
      end
    end
  end
  
  describe "#quick_info(vehicle)" do
    include ApplicationHelper
    
    context "when the vehicle is a car" do
      it "displays the formated kilometrage, the energy type, the boite_vitesse type and the plaque number" do
        vehicle = Voiture.make(:modele => "Peugeot 206", :kilometrage => 60000, :energy => "Essence",
          :boite_vitesse => "Manuel")
        helper.stub(:format_km).and_return("60000.00 km")
        content = helper.quick_info(vehicle)
        content.should_not be_nil
        content.should == "60000.00 km - Essence - Boite Manuel - Immatriculé : #{vehicle.immatriculation}"
      end
    end
    
    context "when the vehicle is a motorbike" do
      it "displays the formated kilometrage, the energy type and the plaque number" do
          vehicle = Moto.make(:modele => "Yamaha 1525", :cylindree => "750", :annee => 5.years.ago, :price => 6000)
          helper.stub(:format_km).and_return("60000.00 km")
          content = helper.quick_info(vehicle)
          content.should_not be_nil
          content.should == "60000.00 km - Immatriculé : #{vehicle.immatriculation}"
      end      
    end
    
    context "when the vehicle is a Jetski" do
      it "displays nothing" do
        vehicle = Jetski.make()
        content = helper.quick_info(vehicle)
        content.should be_blank
        content.should == ""
      end      
    end
    
    context "when the vehicle is a Bateau (boat)" do
      it "displays nothing" do
        vehicle = Bateau.make()
        content = helper.quick_info(vehicle)
        content.should be_blank
        content.should == ""
      end    
    end
    
  end
end
