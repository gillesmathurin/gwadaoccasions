require 'spec_helper'

describe "/welcome/index" do
  
  context "with vehicles in the database" do
    before(:each) do
      assigns[:vehicle_number] = 1
      assigns[:vehicles_of_the_week] = [mock_model(Vehicle)]
      assigns[:search] = mock_model(Search).as_new_record()      
    end
    
    it "displays the number of vehicles available" do
      render
      response.should contain("1 offre")
    end
    
    it "renders a form to search for vehicles" do
      render
      response.should have_selector("form", :method => 'post', :action => searches_path) do |form|
        form.should have_selector("input", :type => "select")
        form.should have_selector("input", :type => "submit")  
      end
    end
  end
  
  context "with an empty database" do
    before(:each) do
      assigns[:vehicle_number] = 0
      assigns[:user_number] = 0
      assigns[:vehicles_of_the_week] = []
      assigns[:search] = mock_model(Search).as_new_record
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
    
    it "displays 'Pas d'offres pour le moment' with the selection bloc" do
      render
      response.should have_selector(".week_selection") do |selector|
        selector.should contain("Pas d'offres pour le moment.")
      end
    end
    
    it "displays links for professionals and for visitors " do
      render
      response.should have_selector(".registration_block") do |selector|
        selector.should contain("Vous êtes un professionnel ?")
        selector.should have_selector("a", :href =>"/services.html") do |link|
          link.should contain("Découvrez nos services")
        end
        selector.should contain("Vous êtes un particulier ?")
        selector.should have_selector("a", :href => new_user_registration_path) do |link|
          link.should contain("Publiez gratuitement vos annonces")
        end
      end
    end
  end
  

end
