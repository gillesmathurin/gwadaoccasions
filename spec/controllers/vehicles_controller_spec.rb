require 'spec_helper'

describe VehiclesController do

  #Delete these examples and add some real ones
  it "should use VehiclesController" do
    controller.should be_an_instance_of(VehiclesController)
  end

  def mock_vehicle(stubs={})
    @mock_vehicle ||= mock_model(Vehicle, stubs)
  end
  
  describe "GET 'show'" do
    it "assigns the requested vehicle as @vehicle" do
      Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
      get :show, :id => "37"
    end
    
    it "renders the show template" do
      Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
      get :show, :id => "37"
      response.should render_template(:show)      
    end
  end
  
  describe "GET 'index'" do
    
    it "assigns a list of vehicles as @vehicles" do
      Vehicle.should_receive(:paginate).and_return([mock_vehicle])
      get :index, :params => {:per_page => 15, :page => nil}
    end
    
    it "renders the index template" do
      Vehicle.should_receive(:paginate).and_return([mock_vehicle])
      get :index, :params => {:per_page => 15, :page => nil}
      response.should render_template(:index)      
    end
  end
end
