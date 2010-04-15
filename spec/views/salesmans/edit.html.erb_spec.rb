require 'spec_helper'

describe "/salesmans/edit" do
  before(:each) do
    render 'salesmans/edit'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/salesmans/edit])
  end
end
