require 'spec_helper'

describe "/users/show" do
  
  def mock_user(stubs={})
    @user ||= create_default_user
  end
  
  before(:each) do
    @search_profile = SearchProfile.make(:user_id => mock_user.id, :minprice => 3000, :maxprice => 7000)
    @vehicle = Voiture.make(:modele => "Peugeot 206", :price =>4000,
      :annee => 5.years.ago, :description => "value for description",
      :kilometrage => 60000, :boite_vitesse => "Manuel", :energy => "Essence")
    @vehicle2 = Voiture.make(:modele => "Opel Corsa", :price =>4000,
      :annee => 5.years.ago, :description => "value for description",
      :kilometrage => 60000, :boite_vitesse => "Manuel", :energy => "Essence")  
    @selection = mock_model(Selection, :user_id => mock_user.id, :vehicle_id => @vehicle.id)
    assigns[:selections] = [@selection]
    assigns[:search_profiles] = [@search_profile]
    assigns[:matching_vehicles] = [@vehicle2]
    assigns[:user] = mock_user
    @selection.stub!(:vehicle).and_return(@vehicle)
    render 'users/show'
  end
  
  context "with a selected vehicle" do    
    it "shows the user's selected vehicle" do
      response.should have_selector("#selections") do |selector|
        selector.should contain("Peugeot 206")
        selector.should contain("Année : 2005")
        selector.should contain("4000 €")
      end
    end
    
    it "shows a 'Dé-selectionner' link" do
      response.should have_selector("a", :href => user_selection_path(@user, @selection)) do |link|
        link.should contain("Dé-selectionner")
      end
    end
  end
  
  context "with recorded search profiles" do    
    it "show the user's search profile" do
      response.should have_selector("#search_profiles") do |selector|
        selector.should contain("#{@search_profile.category}")
        selector.should contain("entre : 3 000.00 € et 7 000.00 €")
      end
    end
    
    it "shows compatible vehicles" do
      response.should have_selector(".compatible_vehicles") do |selector|
        selector.should contain("#{@vehicle2.modele} - Année : #{@vehicle2.display_year} - 4000 €")
      end
    end
  end

end
