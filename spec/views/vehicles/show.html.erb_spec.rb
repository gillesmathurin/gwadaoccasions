require 'spec_helper'

describe "/vehicles/show" do
  
  before(:each) do
    assigns[:vehicle] = mock_model(Voiture, :modele => "Peugeot 206", :price =>4000,
     :annee => 2005, :description => "value for description")
    assigns[:vehicle].stub(:display_year).and_return("2005")
    @mock_overviewpic = mock('overviewpic')
    @mock_frontpic = mock('frontpic')
    @mock_backpic = mock('backpic')
    @mock_rfrontpic = mock('rfrontpic')
    @mock_lfrontpic = mock('lfrontpic')
    @mock_rbackpic = mock('rbackpic')
    @mock_lbackpic = mock('lbackpic')
    assigns[:vehicle].should_receive(:overviewpic).and_return(@mock_overviewpic)
    @mock_overviewpic.should_receive(:url).and_return("/images/url_overviewpic")
    assigns[:vehicle].should_receive(:frontpic).and_return(@mock_frontpic)
    @mock_frontpic.stub(:url).and_return("/images/url_frontpic")
    assigns[:vehicle].should_receive(:backpic).and_return(@mock_backpic)
    @mock_backpic.stub(:url).and_return("/images/url_backpic")
    assigns[:vehicle].should_receive(:rfrontpic).and_return(@mock_rfrontpic)
    @mock_rfrontpic.stub(:url).and_return("/images/url_rfrontpic")
    assigns[:vehicle].should_receive(:lfrontpic).and_return(@mock_lfrontpic)
    @mock_lfrontpic.stub(:url).and_return("/images/url_lfrontpic")
    assigns[:vehicle].should_receive(:rbackpic).and_return(@mock_rbackpic)
    @mock_rbackpic.stub(:url).and_return("/images/url_rbackpic")
    assigns[:vehicle].should_receive(:lbackpic).and_return(@mock_lbackpic)
    @mock_lbackpic.stub(:url).and_return("/images/url_lbackpic")
  end

  it "should display the modele, year and the price of the vehicle" do
    render 'vehicles/show'    
    response.should have_selector(".vehicle_description") do |selector|
      selector.should contain("Peugeot 206")
      selector.should contain("Année : 2005")
      selector.should contain("4000 €")
    end
  end

  it "should display 6 thumb pictures of the vehicle " do
    render
    response.should have_selector(".gallery") do |selector|
      selector.should have_selector("img", :src => "/images/url_overviewpic")
      selector.should have_selector("img", :src => "/images/url_frontpic")
      selector.should have_selector("img", :src => "/images/url_backpic")
      selector.should have_selector("img", :src => "/images/url_rfrontpic")
      selector.should have_selector("img", :src => "/images/url_lfrontpic")
      selector.should have_selector("img", :src => "/images/url_rbackpic")
      selector.should have_selector("img", :src => "/images/url_lbackpic")
    end
  end

  it "should display the description of the vehicle" do
    render
    response.should have_selector(".description") do |selector|
      selector.should contain("value for description")
    end
  end
  
end
