require 'spec_helper'

describe Search do
  before(:each) do
    @valid_attributes = {
      :category => "value for category",
      :minprice => 1,
      :maxprice => 1,
      :minkilometrage => 200,
      :maxkilometrage => 100000,
      :minyear => 1960,
      :maxyear => Date.today.year,
      :energy => "Essence",
      :boite_vitesse => "Manuel"
    }
  end

  it "should create a new instance given valid attributes" do
    @search = Search.new()
  end
  
  describe ".vehicles" do
        
    context "search by price" do
      
      before(:each) do
        @car = Car.make(:price => 5000)
      end
      
      it "finds vehicles with correct price only" do
        @search = Search.new(:minprice => "0", :maxprice => "10000")
        @search.vehicles.should have_at_least(1).record
        @search.vehicles.should include(@car)
        @search = Search.new(:minprice => "10000", :maxprice => "20000")
        @search.vehicles.should have(0).record
      end

    end
    
    context "search by kilometrage" do
      
      before(:each) do
        @car = Car.make(:kilometrage => 25000)
      end
      
      it "finds vehicles with correct kilometrage only" do
        @search = Search.new(:minkilometrage => "10000", :maxkilometrage => "15000")
        @search.vehicles.should have(0).record
        @search = Search.new(:minkilometrage => "10000", :maxkilometrage => "30000")
        @search.vehicles.should have_at_least(1).record
      end
      
    end
    
    context "search by year" do
      
      before(:each) do
        @car = Car.make(:annee => 7.years.ago)
      end
      
      it "finds vehicles with correct year only" do
        @search = Search.new(:minyear => "1990", :maxyear => "2000")
        @search.vehicles.should have(0).record
        @search = Search.new(:minyear => "1990", :maxyear => "2010")
        @search.vehicles.should have_at_least(1).record
      end
      
    end
    
    context "search by energy type" do
      
      before(:each) do
        @car = Car.make(:energy => "Essence")
      end
      
      it "finds vehicles with correct energy type only" do
        @search = Search.new(:energy => "Diesel")
        @search.vehicles.should have(0).record
        @search = Search.new(:energy => "Essence")
        @search.vehicles.should include(@car)
      end
      
    end
    
    context "search by boite_vitesse type" do
      
      before(:each) do
        @car = Car.make(:boite_vitesse => "Manuel")
      end
      
      it "finds vehicles with correct boite_vitess only" do
        @search = Search.new(:boite_vitesse => "Automatique")
        @search.vehicles.should have(0).records
      end     

    end
    
    context "search with multiple criterias" do
      
      before(:each) do
        @car1 = Car.make(:price => 5000, :kilometrage => 20000, :annee => 5.years.ago, :energy => "Electrique")
        @car2 = Car.make(:price => 7000, :kilometrage => 17000, :annee => 3.years.ago, :boite_vitesse => "Manuel")
        puts Vehicle.count
      end
      
      it "finds the compatible vehicles" do
        @search = Search.new(:minyear => "2000", :maxyear => "2009", :minprice => "4500", :maxprice => "10000",
         :minkilometrage => "10000", :maxkilometrage => "30000" )
        @search.vehicles.should have(2).records
      end

    end
  end
end
