Given /^I have not visited the site$/ do
end

Given /^there is no Vehicle$/ do
  @vehicules = []
end

When /^I enter the welcome page$/ do
  visit root_path
end

Then /^I should see a menu bar$/ do
  visit root_path
  response.should have_selector("ul.menubar")
  response.should contain("Catalogue")
  response.should contain("Nos Services")
  response.should contain("Abonnez-vous")
  response.should contain("Aide")
  response.should contain("Connexion")
end

Then /^I should see a "([^\"]*)"$/ do |text|
  response.should contain(text)
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
