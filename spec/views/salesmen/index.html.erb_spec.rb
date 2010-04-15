require 'spec_helper'

describe "/salesmen/index.html.erb" do
  include SalesmenHelper

  before(:each) do
    assigns[:salesmen] = [
      stub_model(Salesman,
        :name => "value for name",
        :mobile_phone => "value for mobile_phone"
      ),
      stub_model(Salesman,
        :name => "value for name",
        :mobile_phone => "value for mobile_phone"
      )
    ]
  end

  it "renders a list of salesmen" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for mobile_phone".to_s, 2)
  end
end
