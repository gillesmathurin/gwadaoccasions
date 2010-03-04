Given /^I have not visited the site$/ do
end

Given /^there is no Vehicle$/ do
  @vehicules = []
end

When /^I enter the welcome page$/ do
  visit root_path
end

Then /^I should see a menu bar$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a search form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)" link$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)" in a text\-block$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)" text$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)" in the page$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a "([^\"]*)" message$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
