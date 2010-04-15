require 'spec_helper'

describe "/salesmen/edit.html.erb" do
  include SalesmenHelper

  before(:each) do
    assigns[:salesman] = @salesman = stub_model(Salesman,
      :new_record? => false,
      :name => "value for name",
      :mobile_phone => "value for mobile_phone"
    )
  end

  it "renders the edit salesman form" do
    render

    response.should have_tag("form[action=#{salesman_path(@salesman)}][method=post]") do
      with_tag('input#salesman_name[name=?]', "salesman[name]")
      with_tag('input#salesman_mobile_phone[name=?]', "salesman[mobile_phone]")
    end
  end
end
