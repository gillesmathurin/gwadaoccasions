require 'spec_helper'

describe "/welcome/index" do
  
  def mock_search(stubs = {})
    @mock_search ||= mock_model(Search, stubs).as_new_record
  end
  
  def mock_vehicle(stubs = {})
    @vehicle ||= mock_model(Vehicle, stubs)
  end
  
  def valid_attributes
      {
        :type => "value for type",
        :price => 1,
        :kilometrage => 1,
        :annee => Date.today,
        :immatriculation => "value for immatriculation",
        :serialnumber => "value for serialnumber",
        :modele => "value for modele",
        :marque_id => 1,
        :cylindree => "value for cylindree",
        :energy => "value for energy",
        :boite_vitesse => "value for boite_vitesse",
        :description => "value for description",
        :overviewpic_file_name => "value for overviewpic_file_name",
        :overviewpic_file_size => 1,
        :overviewpic_content_type => "value for overviewpic_content_type",
        :overviewpic_updated_at => Time.now,
        :display_year => Date.today.year
      }
  end
  
  context "with vehicles in the database and registered users" do
    before(:each) do
      assigns[:vehicle_number] = 1
      assigns[:user_number] =1      
      assigns[:vehicles_of_the_week] = [mock_vehicle(valid_attributes)]
      assigns[:search] = mock_search(:category => "", :minprice => "",
       :maxprice => "", :minyear => Date.today, :maxyear => Date.today,
       :minkilometrage => "", :maxkilometrage => "", :energy => "",
       :boite_vitesse => "")
    end
    
    it "displays the number of vehicles available" do
      render
      response.should contain("1 offre")
    end
    
    it "renders a form to search for vehicles" do
      render
      response.should have_selector("form", :method => 'post', :action => searches_path) do |form|
        form.should have_selector("select", :name => "search[category]")
        # TODO WRITE THE REST OF THE FORM
        form.should have_selector("input", :type => "submit")  
      end
    end
    it "displays the number of registered users" do
      render
      response.should contain("1 utilisateur(s) enregistré(s)")
    end
  end
  
  context "with an empty database" do
    before(:each) do
      assigns[:vehicle_number] = 0
      assigns[:user_number] = 0
      assigns[:vehicles_of_the_week] = []
      assigns[:search] = mock_search(:category => "", :minprice => "",
       :maxprice => "", :minyear => Date.today, :maxyear => Date.today,
       :minkilometrage => "", :maxkilometrage => "", :energy => "",
       :boite_vitesse => "")
    end
    
    it "display a 0 offres message" do
      render
      response.should have_selector(".database_state")
      response.should contain("0 offre(s)")
    end
    
    it "display a 0 compte visiteur message" do
      render
      response.should have_selector(".database_state")
      response.should contain("0 utilisateur(s) enregistré(s)")
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
