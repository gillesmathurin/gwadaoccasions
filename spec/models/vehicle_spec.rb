require 'spec_helper'

describe Vehicle do
  
  before(:each) do
    @valid_attributes = {
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
        :overviewpic_updated_at => Time.now
      }
  end
  
  it "should create a new instance given valid attributes" do
    Vehicle.create!(@valid_attributes)
  end
  
  it "requires an annee attribute" do
    @vehicle = Vehicle.new(:annee => nil)
    @vehicle.should_not be_valid
    @vehicle.should have(1).error_on(:annee)
  end
  
  it "requires an unique immatriculation attribute" do
    @vehicle = Vehicle.create(@valid_attributes)
    @vehicle2 = Vehicle.create(@valid_attributes)
    @vehicle2.should have(1).errors_on(:immatriculation)
  end
  
  describe "#display_year" do

    before(:each) do
      @vehicle = Vehicle.new(@valid_attributes)
    end

    it "should have a annee attribute" do
      @vehicle.should be_valid
      @vehicle.annee.should_not be_nil
    end

    it "returns only the year of the annee attribute" do
      @vehicle.display_year.should == Date.today.year
    end
  end
  
  describe "#of_the_week" do
    
    it "fetches only vehicle selected for the week" do
      @vehicle = Vehicle.make()
      @vehicle2 = Vehicle.make(:select_for_week => true)
      results = Vehicle.of_the_week()
      results.should have(1).record
      results.should include(@vehicle2)
      results.should_not include(@vehicle)
    end
    
  end
  
  describe "#sold" do
    
    it "returns the sold vehicles" do
      @vehicle = Vehicle.make(:disponibilite => true)
      @vehicle2 = Vehicle.make(:disponibilite => false)
      results = Vehicle.sold
      results.should include(@vehicle2)
      results.should_not include(@vehicle)
    end
  end
  
  describe "#with_price_criterias(type, minprice, maxprice)" do
    before(:each) do
      @vehicle = Voiture.make(:price => 6000)
    end
    
    it "fetches vehicles whose price is between the price criterias" do      
      results = Vehicle.with_price_criterias(@vehicle.type, @vehicle.price, @vehicle.price)
      results.should include(@vehicle)
    end
    
    it "doesn't fetch vehicles whose price is out of price criterias" do
      results = Vehicle.with_price_criterias(@vehicle.type, 3000, 5000)
      results.should_not include(@vehicle)
    end
  end
  
  describe "#matching_searchprofiles" do
    
    it "fetches search profiles based on vehicle price and kilometrage" do
      @vehicle = Vehicle.make(:price => 5000, :kilometrage => 143000)
      @searchprofile = SearchProfile.make(:minprice => 3000, :maxprice => 6000, :maxkilometer => 150000,
      :minkilometer => 130000)
      results = @vehicle.matching_searchprofiles
      results.should include(@searchprofile)
    end
    
  end
end
