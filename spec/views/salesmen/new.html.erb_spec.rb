require 'spec_helper'

describe "/salesmen/new.html.erb" do
  include SalesmenHelper

  before(:each) do
    assigns[:salesman] = stub_model(Salesman,
      :new_record? => true,
      :name => "value for name",
      :mobile_phone => "value for mobile_phone"
    )
  end

  it "renders new salesman form" do
    render

    response.should have_tag("form[action=?][method=post]", salesmen_path) do
      with_tag("input#salesman_name[name=?]", "salesman[name]")
      with_tag("input#salesman_mobile_phone[name=?]", "salesman[mobile_phone]")
    end
  end
end
