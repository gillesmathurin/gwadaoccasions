require 'spec_helper'

describe VehiclesController do

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
  
  def mock_provider(stubs={:status => 'active'})
    @mock_provider ||= Provider.make(stubs)
  end
  
  describe "GET 'new'" do
    before(:each) do
      sign_in(mock_provider)
    end
    
    it "assigns a new vehicle as @vehicle for the current provider" do
      controller.stub_chain(:current_provider, :vehicles, :build).and_return(mock_vehicle.as_new_record)
      get :new
      assigns[:vehicle].should eql(mock_vehicle.as_new_record)
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      sign_in(mock_provider)
      controller.stub!(:current_provider).and_return(mock_provider)
    end
    
    context "with valid params" do
      it "assigns a newly created provider's vehicle as @vehicle" do
        controller.stub_chain(:current_provider, :vehicles, :build).with({"these" => "params"}).
          and_return(mock_vehicle(:save => true))
        mock_vehicle.stub(:[]=).with(:type, nil)
        post :create, :vehicle => {:these => "params"}
      end
      
      it "redirects to the provider's vehicles list page" do
        controller.stub_chain(:current_provider, :vehicles, :build).with({"these" => "params"}).
          and_return(mock_vehicle(:save => true))
        mock_vehicle.stub(:[]=).with(:type, nil)
        post :create, :vehicle => {:these => "params"}
        response.should redirect_to(provider_vehicles_url(mock_provider))
      end
    end
    
    context "with invalid params" do
      it "assigns a newly but unsaved provider's vehicle as @vehicle" do
        controller.stub_chain(:current_provider, :vehicles, :build).with({}).
          and_return(mock_vehicle(:save => false))
        mock_vehicle.stub(:[]=).with(:type, nil)
        post :create, :vehicle => {}
      end
      
      it "re-renders the new template" do
        controller.stub_chain(:current_provider, :vehicles, :build).with({}).
          and_return(mock_vehicle(:save => false))
        mock_vehicle.stub(:[]=).with(:type, nil)
        post :create, :vehicle => {}
        response.should render_template(:new)        
      end
    end
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
  
  describe "POST 'tellafriend'" do
    
    before(:each) do
      Vehicle.stub!(:find)
      VehicleMailer.stub!(:deliver_to_friend)
    end
    
    it "finds the requested vehicle as @vehicle" do
      Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
      post :tellafriend, :id => "37", :friend_email => "foo@bar.com"
    end
    
    context "email sent with success" do
      it "sends and email to the email owner with the @vehicle infos" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        VehicleMailer.should_receive(:deliver_to_friend).
          with("monemail@bar.com", "foo@bar.com", mock_vehicle)
        post :tellafriend, :id => "37", :from_email => "monemail@bar.com",
          :friend_email => "foo@bar.com"
      end

      it "displays a 'Email envoyé avec succès.' message" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        VehicleMailer.should_receive(:deliver_to_friend).
          with("monemail@bar.com", "foo@bar.com", mock_vehicle).and_return(true)
        post :tellafriend, :id => "37", :from_email => "monemail@bar.com",
          :friend_email => "foo@bar.com"
        flash[:notice].should == "Email envoyé à votre ami."
      end
    end
    
    context "email not sent successfully" do
      it "displays a 'Email envoyé avec succès.' message" do
        Vehicle.should_receive(:find).with("37").and_return(mock_vehicle)
        VehicleMailer.should_receive(:deliver_to_friend).
          with("monemail@bar.com", "foo@bar.com", mock_vehicle).and_return(false)
        post :tellafriend, :id => "37", :from_email => "monemail@bar.com",
          :friend_email => "foo@bar.com"
        flash[:notice].should == "Vérifiez les adresses emails saisies."
      end
    end
  end
end
