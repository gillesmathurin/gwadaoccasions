require 'spec_helper'

describe SearchesController do

  #Delete this example and add some real ones
  it "should use SearchesController" do
    controller.should be_an_instance_of(SearchesController)
  end
  
  describe "POST 'create'" do
    before(:each) do
      @search = mock_model(Search)
      @vehicle = mock_model(Vehicle)
    end
    
    context "with valid params" do
      it "assigns a newly created search as @search" do
        Search.should_receive(:new).with({'these' => 'params'}).and_return(@search)
        @search.should_receive(:vehicles).and_return([@vehicle])
        post :create, :search => {:these => "params"}
      end
      
      it "assigns fetched vehicles as @vehicles" do
        Search.should_receive(:new).with({'these' => 'params'}).and_return(@search)
        @search.should_receive(:vehicles).and_return([@vehicle])
        post :create, :search => {:these => "params"}
        assigns[:vehicles].should == [@vehicle]
      end
      
      it "renders to the welcome/index view" do
        Search.should_receive(:new).with({'these' => 'params'}).and_return(@search)
        @search.should_receive(:vehicles).and_return([@vehicle])
        post :create, :search => {:these => "params"}
        assigns[:vehicles].should == [@vehicle]
        response.should render_template("welcome/index")
        
      end
    end
  end
end
