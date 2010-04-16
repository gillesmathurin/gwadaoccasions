require 'spec_helper'

describe SalesmenController do

  def mock_salesman(stubs={})
    @mock_salesman ||= mock_model(Salesman, stubs)
  end
  
  def mock_provider(stubs={:status => 'active'})
    @mock_provider ||= Provider.make(stubs)
  end

  describe "GET index" do
    before(:each) do
      sign_in(mock_provider)
      controller.stub_chain(:current_provider, :salesmen).and_return([mock_salesman])
    end
    it "assigns all salesmens as @salesmens" do
      controller.stub_chain(:current_provider, :salesmen).and_return([mock_salesman])
      get :index
      assigns[:salesmen].should == [mock_salesman]
    end
  end

  describe "GET show" do
    before(:each) do
      sign_in(mock_provider(:status => 'active'))
      controller.stub_chain("current_provider", 'salesmen').and_return(mock_provider(:status =>'active'))
    end
    it "assigns the requested salesman as @salesman" do
      Salesman.stub(:find).with("37").and_return(mock_salesman)
      get :show, :id => "37"
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "GET new" do
    before(:each) do
      sign_in(mock_provider)
      controller.stub_chain(:current_provider, :salesmen, :build).and_return(mock_salesman.as_new_record)
    end
    
    it "assigns a new salesman as @salesman" do
      get :new, :provider_id => mock_provider.id
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "GET edit" do
    before(:each) do
      sign_in(mock_provider)
      controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman)
    end
    
    it "assigns the requested salesman as @salesman" do
      controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman)
      get :edit, :provider_id => mock_provider.id, :id => "37"
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "POST create" do
    before(:each) do
      sign_in(mock_provider)
    end

    describe "with valid params" do
      before(:each) do
        controller.stub_chain(:current_provider, :salesmen, :build).
          and_return(mock_salesman(:save => true))
      end
      it "assigns a newly created salesman as @salesman" do
        controller.stub_chain(:current_provider, :salesmen, :build).with({'these' => 'params'}).
          and_return(mock_salesman(:save => true))
        post :create, :salesman => {:these => 'params'}
        assigns[:salesman].should equal(mock_salesman)
      end

      it "redirects to the provider root page" do
        controller.stub_chain(:current_provider, :salesmen, :build).and_return(mock_salesman(:save => true))
        post :create, :salesman => {}
        response.should redirect_to(provider_root_url(mock_provider))
      end
    end

    describe "with invalid params" do
      before(:each) do
        controller.stub_chain(:current_provider, :salesmen, :build).and_return(mock_salesman(:save => false))
      end
      
      it "assigns a newly created but unsaved salesman as @salesman" do
        post :create, :salesman => {:these => 'params'}
        assigns[:salesman].should equal(mock_salesman)
      end

      it "re-renders the 'new' template" do
        post :create, :salesman => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do
    before(:each) do
      sign_in(mock_provider)
    end

    describe "with valid params" do
      before(:each) do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman)
      end
      
      it "updates the requested salesman" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman)
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :salesman => {:these => 'params'}
      end

      it "assigns the requested salesman as @salesman" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman(:update_attributes => true))
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "1", :salesman => {:these => 'params'}
        assigns[:salesman].should equal(mock_salesman)
      end

      it "redirects to the provider's salesmen list page" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman(:update_attributes => true))
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "1", :salesman => {:these => 'params'}
        response.should redirect_to(provider_salesmen_url(mock_provider))
      end
    end

    describe "with invalid params" do
      it "updates the requested salesman" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman)
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :salesman => {:these => 'params'}
      end

      it "assigns the salesman as @salesman" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman(:update_attributes => false))
        put :update, :id => "1"
        assigns[:salesman].should equal(mock_salesman)
      end

      it "re-renders the 'edit' template" do
        controller.stub_chain(:current_provider, :salesmen, :find).and_return(mock_salesman(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    before(:each) do
      sign_in(mock_provider)
    end
    
    it "destroys the requested salesman" do
      Salesman.should_receive(:find).with("37").and_return(mock_salesman)
      mock_salesman.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the provider's salesmen list" do
      Salesman.stub(:find).and_return(mock_salesman(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(provider_salesmen_url(mock_provider))
    end
  end

end
