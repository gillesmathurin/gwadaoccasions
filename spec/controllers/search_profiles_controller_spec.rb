require 'spec_helper'

describe SearchProfilesController do

  #Delete these examples and add some real ones
  it "should use SearchProfilesController" do
    controller.should be_an_instance_of(SearchProfilesController)
  end
  
  def search_profile(stubs ={})
    @mock_searchprofile ||= mock_model(SearchProfile, stubs)
  end


  describe "GET 'new'" do
    
    context "with an authenticated user" do
      before(:each) do
        @user = create_default_user
        sign_in(@user)
        @current_user = mock("current_user")
        @mock_searchprofiles = mock('search_profiles')
        @search_profile = mock_model(SearchProfile).as_new_record
        controller.stub(:current_user).and_return(@current_user)
        @current_user.stub(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.stub(:build).and_return(@search_profile)
      end

      it "assigns a new search profile as @search_profile" do
        controller.should_receive(:current_user).and_return(@current_user)
        @current_user.should_receive(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.should_receive(:build).and_return(@search_profile)
        get :new
        assigns[:search_profile].should == @search_profile
      end
      
      it "renders the new template" do
        get :new
        assigns[:search_profile].should == @search_profile
        response.should render_template('new')
      end
    end
    
    context "without an authenticated user" do
      it "redirects to the sign_in page" do
        get :new
        response.should redirect_to("/users/sign_in?unauthenticated=true")
      end
    end
  end
  
  describe "POST 'create'" do
    
    context "with valid params" do
      
      before(:each) do
        @user = create_default_user
        sign_in(@user)
        @current_user = mock("current_user")
        @mock_searchprofiles = mock('search_profiles')
        controller.stub(:current_user).twice.and_return(@user)
        @user.stub(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.stub(:build).with({'these' => "params"}).and_return(search_profile(:save => true))
      end
      
      it "assigns a newly but unsaved search profile as @search_profile" do
        controller.should_receive(:current_user).twice.and_return(@user)
        @user.should_receive(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.should_receive(:build).with({'these' => "params"}).and_return(search_profile(:save => true))
        post :create, :search_profile => {:these => 'params'}
      end
      
      it "renders a flash message and redirect to the user profile page" do
        post :create, :search_profile => {:these => 'params'}
        flash[:notice].should == "Profil de recherche enregistré."
        response.should redirect_to(user_path(@user.id))        
      end
    end
    
    context "with unvalid params" do
      
      before(:each) do
        @user = create_default_user
        sign_in(@user)
        @current_user = mock("current_user")
        @mock_searchprofiles = mock('search_profiles')
        controller.stub(:current_user).twice.and_return(@user)
        @user.stub(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.stub(:build).with({'these' => "params"}).and_return(search_profile(:save => false))
      end
      
      it "re-renders to the new template" do
        post :create, :search_profile => {:these => 'params'}
        response.should render_template(:new)        
      end
    end
  end
  
  describe "PUT update" do
    context "with valid params" do
      before(:each) do
        @user = create_default_user
        sign_in(@user)
        @current_user = mock("current_user")
        @mock_searchprofiles = mock('search_profiles')
        controller.stub(:current_user).twice.and_return(@user)
        @user.stub(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.stub(:find).with("37").and_return(search_profile)
      end
      
      it "finds and updates the requested search profile" do
        @mock_searchprofiles.should_receive(:find).with("37").and_return(search_profile)
        search_profile.should_receive(:update_attributes).and_return(true)
        put :update, :user_id => @user.id, :id => "37",
         :search_profile => {:these => "params"}
      end
      
      it "redirects to the current user profile page" do
        @mock_searchprofiles.should_receive(:find).with("37").and_return(search_profile)
        search_profile.should_receive(:update_attributes).and_return(true)
        put :update, :user_id => @user.id, :id => "37",
         :search_profile => {:these => "params"}
        response.should redirect_to(user_path(@user.id))                        
      end
    end
    
    context "with unvalid params" do
      before(:each) do
        @user = create_default_user
        sign_in(@user)
        @current_user = mock("current_user")
        @mock_searchprofiles = mock('search_profiles')
        controller.stub(:current_user).twice.and_return(@user)
        @user.stub(:search_profiles).and_return(@mock_searchprofiles)
        @mock_searchprofiles.stub(:find).with("37").and_return(search_profile)
        search_profile.stub(:update_attributes).and_return(false)
      end
      
      it "re-renders the edit template" do
        put :update, :user_id => @user.id, :id => "37",
         :search_profile => {}
         response.should render_template(:edit)         
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @user = create_default_user
      sign_in(@user)
      @current_user = mock("current_user")
      @mock_searchprofiles = mock('search_profiles')
      controller.stub(:current_user).twice.and_return(@user)
      @user.stub(:search_profiles).and_return(@mock_searchprofiles)
    end
    
    it "finds and destroys the requested search profile" do
      @mock_searchprofiles.should_receive(:find).with("37").and_return(search_profile)
      search_profile.should_receive(:destroy)
      delete :destroy, :user_id => @user.id, :id => "37"
    end
    
    it "redirects to the current_user profile page" do
      @mock_searchprofiles.should_receive(:find).with("37").and_return(search_profile)
      search_profile.should_receive(:destroy)
      delete :destroy, :user_id => @user.id, :id => "37"
      response.should redirect_to(user_path(@user.id))
      
    end
  end
end
