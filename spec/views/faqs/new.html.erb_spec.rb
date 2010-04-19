require 'spec_helper'

describe "/faqs/new.html.erb" do
  include FaqsHelper

  before(:each) do
    assigns[:faq] = stub_model(Faq,
      :new_record? => true,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders new faq form" do
    render

    response.should have_tag("form[action=?][method=post]", faqs_path) do
      with_tag("input#faq_question[name=?]", "faq[question]")
      with_tag("textarea#faq_answer[name=?]", "faq[answer]")
    end
  end
end
