require 'spec_helper'

describe UsersController do

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end
  
  def user
    # @user ||= create_default_user
    @user ||= User.make
    @user.confirm!
    @user
  end
  
  describe "GET 'show'" do
    before(:each) do
      sign_in(user)
      @mock_currentuser = user
      @search_profile = mock_model(SearchProfile, :user_id => @mock_currentuser.id)
      controller.stub(:current_user).and_return(user)
    end
    
    it "assigns the current_user as @user" do
      get :show
      assigns[:user].should == @mock_currentuser
    end
    
    it "assigns the current_user search profiles as @search_profiles" do
      @mock_currentuser.should_receive(:search_profiles).and_return([@search_profile])
      get :show
      assigns[:search_profiles].should == [@search_profile]
    end
    
    it "assigns the current_user selections as @selections" do
      @selections = [mock_model(Selection)]
      @mock_currentuser.should_receive(:selections).and_return(@selections)
      get :show
      assigns[:selections].should == @selections
    end
    
    it "assigns the current_user search profiles comptabible vehicles as @compatible_vehicles" do
      @compatible_vehicles = mock('compatible_vehicles')
      get :show
      assigns[:compatible_vehicles].should == @compatible_vehicles
    end
  end
end
