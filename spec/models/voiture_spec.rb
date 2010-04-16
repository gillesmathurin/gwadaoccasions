require 'spec_helper'

describe Voiture do
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
    @car = Voiture.make
    @car.should be_valid
    Voiture.create!(@valid_attributes)
  end
  
  it "requires a date value for annee" do
    @car = Voiture.new(@valid_attributes.except(:annee))
    @car.should_not be_valid
    @car.should have(1).error_on(:annee)
  end
  
end
