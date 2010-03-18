require 'spec_helper'

describe UsersController do

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end
  
  def user
    @user ||= create_default_user
  end
  
  describe "GET 'show'" do
    before(:each) do
      sign_in(user)
      @mock_currentuser = user
      # controller.stub(:current_user).and_return(@user)
    end
    
    it "assigns the current_user as @user" do
      get :show
      assigns[:user].should == @mock_currentuser
    end
  end
end
