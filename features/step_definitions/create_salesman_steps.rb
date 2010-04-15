Given /^I have "([^\"]*)" salesman$/ do |arg1|
  @provider.salesmans.count == arg1
end

When /^I fill in the following$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I press\t"([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should have "([^\"]*)" salesman$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end