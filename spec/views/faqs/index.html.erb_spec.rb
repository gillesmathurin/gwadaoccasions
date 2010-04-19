require 'spec_helper'

describe "/faqs/index.html.erb" do
  include FaqsHelper

  before(:each) do
    assigns[:faqs] = [
      stub_model(Faq,
        :question => "value for question",
        :answer => "value for answer"
      ),
      stub_model(Faq,
        :question => "value for question",
        :answer => "value for answer"
      )
    ]
  end

  it "renders a list of faqs" do
    render
    response.should have_tag("tr>td", "value for question".to_s, 2)
    response.should have_tag("tr>td", "value for answer".to_s, 2)
  end
end
