require 'spec_helper'

describe FaqsController do
  before(:each) do
    @admin = Admin.make
    sign_in(@admin)
  end

  def mock_faq(stubs={})
    @mock_faq ||= mock_model(Faq, stubs)
  end

  describe "GET index" do
    it "assigns all faqs as @faqs" do
      Faq.stub(:find).with(:all).and_return([mock_faq])
      get :index
      assigns[:faqs].should == [mock_faq]
    end
  end

  describe "GET show" do
    it "assigns the requested faq as @faq" do
      Faq.stub(:find).with("37").and_return(mock_faq)
      get :show, :id => "37"
      assigns[:faq].should equal(mock_faq)
    end
  end

  describe "GET new" do
    it "assigns a new faq as @faq" do
      Faq.stub(:new).and_return(mock_faq)
      get :new
      assigns[:faq].should equal(mock_faq)
    end
  end

  describe "GET edit" do
    it "assigns the requested faq as @faq" do
      Faq.stub(:find).with("37").and_return(mock_faq)
      get :edit, :id => "37"
      assigns[:faq].should equal(mock_faq)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created faq as @faq" do
        Faq.stub(:new).with({'these' => 'params'}).and_return(mock_faq(:save => true))
        post :create, :faq => {:these => 'params'}
        assigns[:faq].should equal(mock_faq)
      end

      it "redirects to the created faq" do
        Faq.stub(:new).and_return(mock_faq(:save => true))
        post :create, :faq => {}
        response.should redirect_to(faq_url(mock_faq))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved faq as @faq" do
        Faq.stub(:new).with({'these' => 'params'}).and_return(mock_faq(:save => false))
        post :create, :faq => {:these => 'params'}
        assigns[:faq].should equal(mock_faq)
      end

      it "re-renders the 'new' template" do
        Faq.stub(:new).and_return(mock_faq(:save => false))
        post :create, :faq => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested faq" do
        Faq.should_receive(:find).with("37").and_return(mock_faq)
        mock_faq.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faq => {:these => 'params'}
      end

      it "assigns the requested faq as @faq" do
        Faq.stub(:find).and_return(mock_faq(:update_attributes => true))
        put :update, :id => "1"
        assigns[:faq].should equal(mock_faq)
      end

      it "redirects to the faq" do
        Faq.stub(:find).and_return(mock_faq(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(faq_url(mock_faq))
      end
    end

    describe "with invalid params" do
      it "updates the requested faq" do
        Faq.should_receive(:find).with("37").and_return(mock_faq)
        mock_faq.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faq => {:these => 'params'}
      end

      it "assigns the faq as @faq" do
        Faq.stub(:find).and_return(mock_faq(:update_attributes => false))
        put :update, :id => "1"
        assigns[:faq].should equal(mock_faq)
      end

      it "re-renders the 'edit' template" do
        Faq.stub(:find).and_return(mock_faq(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested faq" do
      Faq.should_receive(:find).with("37").and_return(mock_faq)
      mock_faq.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the faqs list" do
      Faq.stub(:find).and_return(mock_faq(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(faqs_url)
    end
  end

end
