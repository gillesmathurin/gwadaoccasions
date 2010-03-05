require 'spec_helper'

describe WelcomeController do

  def mock_vehicle(stubs = {})
    @mock_vehicle ||= mock_model(Vehicle, stubs)
  end

  describe "GET 'index'" do
    
    before(:each) do
      @search = mock_model(Search).as_new_record
    end
    
    it "fetches the number of vehicles, visitor account and expose newly created search instance as @search" do
      Search.should_receive(:new).and_return(@search)
      Vehicle.should_receive(:count).and_return("0")
      User.should_receive(:count).and_return("0")
      Vehicle.should_receive(:of_the_week).and_return([mock_vehicle])
      get :index
      response.should render_template(:index)
      assigns[:search].should == @search
      assigns[:vehicles_of_the_week].should == [mock_vehicle]
      assigns[:vehicle_number].should == "0"
      assigns[:user_number].should == "0"
    end
  end
end
