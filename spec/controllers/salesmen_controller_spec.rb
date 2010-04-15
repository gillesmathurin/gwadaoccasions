require 'spec_helper'

describe SalesmenController do

  def mock_salesman(stubs={})
    @mock_salesman ||= mock_model(Salesman, stubs)
  end

  describe "GET index" do
    it "assigns all salesmens as @salesmens" do
      Salesman.stub(:find).with(:all).and_return([mock_salesman])
      get :index
      assigns[:salesmen].should == [mock_salesman]
    end
  end

  describe "GET show" do
    it "assigns the requested salesman as @salesman" do
      Salesman.stub(:find).with("37").and_return(mock_salesman)
      get :show, :id => "37"
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "GET new" do
    it "assigns a new salesman as @salesman" do
      Salesman.stub(:new).and_return(mock_salesman)
      get :new
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "GET edit" do
    it "assigns the requested salesman as @salesman" do
      Salesman.stub(:find).with("37").and_return(mock_salesman)
      get :edit, :id => "37"
      assigns[:salesman].should equal(mock_salesman)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created salesman as @salesman" do
        Salesman.stub(:new).with({'these' => 'params'}).and_return(mock_salesman(:save => true))
        post :create, :salesman => {:these => 'params'}
        assigns[:salesman].should equal(mock_salesman)
      end

      it "redirects to the created salesman" do
        Salesman.stub(:new).and_return(mock_salesman(:save => true))
        post :create, :salesman => {}
        response.should redirect_to(salesman_url(mock_salesman))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved salesman as @salesman" do
        Salesman.stub(:new).with({'these' => 'params'}).and_return(mock_salesman(:save => false))
        post :create, :salesman => {:these => 'params'}
        assigns[:salesman].should equal(mock_salesman)
      end

      it "re-renders the 'new' template" do
        Salesman.stub(:new).and_return(mock_salesman(:save => false))
        post :create, :salesman => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested salesman" do
        Salesman.should_receive(:find).with("37").and_return(mock_salesman)
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :salesman => {:these => 'params'}
      end

      it "assigns the requested salesman as @salesman" do
        Salesman.stub(:find).and_return(mock_salesman(:update_attributes => true))
        put :update, :id => "1"
        assigns[:salesman].should equal(mock_salesman)
      end

      it "redirects to the salesman" do
        Salesman.stub(:find).and_return(mock_salesman(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(salesman_url(mock_salesman))
      end
    end

    describe "with invalid params" do
      it "updates the requested salesman" do
        Salesman.should_receive(:find).with("37").and_return(mock_salesman)
        mock_salesman.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :salesman => {:these => 'params'}
      end

      it "assigns the salesman as @salesman" do
        Salesman.stub(:find).and_return(mock_salesman(:update_attributes => false))
        put :update, :id => "1"
        assigns[:salesman].should equal(mock_salesman)
      end

      it "re-renders the 'edit' template" do
        Salesman.stub(:find).and_return(mock_salesman(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested salesman" do
      Salesman.should_receive(:find).with("37").and_return(mock_salesman)
      mock_salesman.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the salesmen list" do
      Salesman.stub(:find).and_return(mock_salesman(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(salesmen_url)
    end
  end

end
