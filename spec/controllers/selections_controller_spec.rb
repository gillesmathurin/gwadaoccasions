require 'spec_helper'

describe SelectionsController do

  #Delete this example and add some real ones
  it "should use SelectionsController" do
    controller.should be_an_instance_of(SelectionsController)
  end
  
  describe "DELETE, #destroy" do
    context "with a signed_in user" do
      before(:each) do
        @user ||= create_default_user
        sign_in(@user)
        @vehicle = Vehicle.make
        controller.stub!(:current_user).and_return(@user)
        @mock_selections = mock("selections")
        @selection = mock_model(Selection, :user_id => @user.id, :vehicle_id => @vehicle.id)
      end
      
      it "fetches the requested user's selection and destroy it" do
        @user.should_receive(:selections).and_return(@mock_selections)
        @mock_selections.should_receive(:find).with("#{@selection.id}").and_return(@selection)
        @selection.should_receive(:destroy)
        delete :destroy, :user_id => @user.id, :id => @selection.id
      end
      
      it "redirect to the current user's page" do
        @user.should_receive(:selections).and_return(@mock_selections)
        @mock_selections.should_receive(:find).and_return(@selection)
        @selection.should_receive(:destroy)
        delete :destroy, :user_id => @user.id, :id => @selection.id
        response.should redirect_to(user_path(@user.id))
      end
    end
    

  end
  
end
