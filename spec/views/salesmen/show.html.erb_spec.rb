require 'spec_helper'

describe "/salesmen/show.html.erb" do
  include SalesmenHelper
  before(:each) do
    assigns[:salesman] = @salesman = stub_model(Salesman,
      :name => "value for name",
      :mobile_phone => "value for mobile_phone"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ mobile_phone/)
  end
end
