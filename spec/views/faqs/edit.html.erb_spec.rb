require 'spec_helper'

describe "/faqs/edit.html.erb" do
  include FaqsHelper

  before(:each) do
    assigns[:faq] = @faq = stub_model(Faq,
      :new_record? => false,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders the edit faq form" do
    render

    response.should have_tag("form[action=#{faq_path(@faq)}][method=post]") do
      with_tag('input#faq_question[name=?]', "faq[question]")
      with_tag('textarea#faq_answer[name=?]', "faq[answer]")
    end
  end
end
