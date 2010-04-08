require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {}
  end
  
  describe "#matching_vehicles" do
    
    def make_user_with_search_profiles
      User.make do |user|
        user.search_profiles.make(:minprice => 3000, :maxprice => 7000, :category => "Voiture")
        user.search_profiles.make(:minprice => 5000, :maxprice => 10000, :category => "Voiture")
      end
    end
    
    context "the user has search_profiles" do    
      before(:each) do
        @user = make_user_with_search_profiles
        @voiture = Voiture.make(:price => 4000)
        @moto = Moto.make(:price => 5000)
      end

      it "returns a mat vehicle" do
        @vehicles = @user.matching_vehicles
        @vehicles.should include(@voiture)
        @vehicles.should_not include(@moto)
      end
    end

    context "the user hasn't got search_profiles" do
      before(:each) do
        @user = User.make
        @voiture = Voiture.make(:price => 4000)
        @moto = Moto.make(:price => 5000)
      end
      
      it "returns an empty array" do
        @vehicles = @user.matching_vehicles
        @vehicles.should be_empty
      end
    end

  end
end