require 'spec_helper'

describe "/faqs/show.html.erb" do
  include FaqsHelper
  before(:each) do
    assigns[:faq] = @faq = stub_model(Faq,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ question/)
    response.should have_text(/value\ for\ answer/)
  end
end
