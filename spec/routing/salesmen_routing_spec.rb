require 'spec_helper'

describe SalesmenController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/salesmen" }.should route_to(:controller => "salesmen", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/salesmen/new" }.should route_to(:controller => "salesmen", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/salesmen/1" }.should route_to(:controller => "salesmen", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/salesmen/1/edit" }.should route_to(:controller => "salesmen", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/salesmen" }.should route_to(:controller => "salesmen", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/salesmen/1" }.should route_to(:controller => "salesmen", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/salesmen/1" }.should route_to(:controller => "salesmen", :action => "destroy", :id => "1") 
    end
  end
end
