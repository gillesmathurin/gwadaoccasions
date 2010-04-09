Given /^there are no providers yet$/ do
  Provider.delete_all
end

Then /^I should have "([^\"]*)" provider$/ do |arg1|
  @provider = Provider.last
  Provider.count == arg1
end

