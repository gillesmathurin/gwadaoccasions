Spec::Matchers.define :have_link do |href|
  match do |response|
    extend Webrat::Matchers
    response.should have_selector("a", :href => href)
  end
end
