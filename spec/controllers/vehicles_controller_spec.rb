require 'spec_helper'

describe VehiclesController do
  include Warden::Test::Helpers

  #Delete these examples and add some real ones
  it "should use VehiclesController" do
    controller.should be_an_instance_of(VehiclesController)
  end

  def mock_vehicle(stubs={})
    @mock_vehicle ||= mock_model(Vehicle, stubs)
  end
  
  def user
    @user ||= create_default_user
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
  
  describe "PUT 'select'" do
    
    context "with a logged_in user and a un-selected vehicle" do
      before(:each) do
        sign_in(user)
        @mock_vehicles = mock('vehicles')
        @current_user = user
        controller.stub(:current_user).exactly(3).times.and_return(@current_user)
        @current_user.stub(:vehicles).twice.and_return(@mock_vehicles)
        @mock_vehicles.stub(:include?).with(mock_vehicle).and_return(false)
        @mock_vehicles.stub(:<<).with(mock_vehicle).and_return(true)
      end
      
      it "assigns the requested vehicle as @vehicle" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        put :select, :id => "37"
      end
      
      it "adds the vehicle to the current user vehicles list" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        controller.should_receive(:current_user).exactly(3).times.and_return(@current_user)
        @current_user.should_receive(:vehicles).twice.and_return(@mock_vehicles)
        @mock_vehicles.should_receive(:include?).with(mock_vehicle).and_return(false)
        @mock_vehicles.should_receive(:<<).with(mock_vehicle).and_return(true)
        put :select, :id => "37"
      end
      
      it "sets a flash notice and redirect_to the vehicle page" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        @mock_vehicles.should_receive(:<<).with(mock_vehicle).and_return(true)
        put :select, :id => "37"
        flash[:notice].should == "Véhicule ajouté à votre sélection."
        response.should redirect_to(vehicle_path(mock_vehicle))
      end
    end
    
    context "with a logged_in user and a vehicle already selected" do
      before(:each) do
        sign_in(user)
        @mock_vehicles = mock('vehicles')
        @current_user = user
        controller.stub(:current_user).exactly(4).times.and_return(@current_user)
        @current_user.stub(:vehicles).and_return(@mock_vehicles)
        @mock_vehicles.stub(:include?).with(mock_vehicle).and_return(true)
      end
      
      it "assigns the requested vehicle as @vehicle" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        put :select, :id => "37"
      end
      
      it "doesn't add the vehicle to the current user selection list" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        controller.should_receive(:current_user).exactly(4).times.and_return(@current_user)
        @current_user.should_receive(:vehicles).and_return(@mock_vehicles)
        @mock_vehicles.should_receive(:include?).with(mock_vehicle).and_return(true)
        @mock_vehicles.should_not_receive(:<<)
        put :select, :id => "37"      
      end
      
      it "sets a flash notice and redirect_to the vehicle page" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        put :select, :id => "37"
        flash[:notice].should == "Véhicule déjà présent dans votre sélection."
        response.should redirect_to(vehicle_path(mock_vehicle))
      end
    end    

    context "with an unsigned user" do
      it "redirects to the login page" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        put :select, :id => "37"
        response.should redirect_to(new_user_session_path)
      end
    end
  end
  
end
