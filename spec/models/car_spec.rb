require 'spec_helper'

describe Car do
  before(:each) do
    @valid_attributes = {
      :annee => 2009,
      :immatriculation => "value for immatriculation",
      :kilometrage => 20000,
      :modele => "value for modele",
      :energy => "value for energy",
      :boite_vitesse => "value for boite_vitesse",
      :price => 3500
    }
  end

  it "should create a new instance given valid attributes" do
    Car.make
    Car.create!(@valid_attributes)
  end
  
  it "requires an integer value for annee" do
    @car = Car.new(@valid_attributes.except(:annee))
    @car.should_not be_valid
    @car = Car.new(@valid_attributes[:annee => "azerty"])
    @car.should have(1).error_on(:annee)
  end
  
end
