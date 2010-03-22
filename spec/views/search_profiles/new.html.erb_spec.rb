require 'spec_helper'

describe "/search_profiles/new" do
  before(:each) do
    @user = create_default_user
    sign_in(@user)
    assigns[:search_profile] = mock_model(SearchProfile).as_new_record.as_null_object
    render 'search_profiles/new'
  end

  it "renders a form to create a search profile" do
    response.should have_selector(".searchform") do |selector|
      selector.should have_selector("form", :method => "post", :action => user_search_profiles_path(@user)) do |form|
        form.should have_selector("select", :name => "search_profile[category]")
        form.should have_selector("select", :name => "search_profile[minprice]")
        form.should have_selector("select", :name => "search_profile[maxprice]")
        form.should have_selector("select", :name => "search_profile[minkilometer]")
        form.should have_selector("select", :name => "search_profile[maxkilometer]")
      end
    end
  end
end
