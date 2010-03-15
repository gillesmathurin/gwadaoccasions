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
  
  describe ".display_year" do

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
end
