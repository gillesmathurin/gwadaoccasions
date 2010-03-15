# Scenario : Empty database
Given /^I have not visited the site$/ do
end

Given /^there is no Vehicle$/ do
  @vehicle_number = 0
  @user_number = 0
  @vehicles_of_the_week = []
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
  # pending
  response.should have_selector("form", :action => "/searches", :method => "post")
end

Then /^I should see a "([^\"]*)" link$/ do |text|
  response.should contain(text)
  response.should have_link("/services.html")
end

Then /^I should see a "([^\"]*)" in a text\-block$/ do |arg1|
  response.should contain(arg1)
end

Then /^I should see a "([^\"]*)" text$/ do |arg1|
  response.should contain(arg1)
end

Then /^I should see a "([^\"]*)" in the page$/ do |arg1|
  response.should contain(arg1)
end

Then /^I should see a "([^\"]*)" message$/ do |arg1|
  response.should contain(arg1)
end

# With vehicles and registered users
Given /^there are 2 Vehicles in the database$/ do
  Vehicle.make(:price => "3000")
  Vehicle.make(:price => "5000")
end

Given /^there are 2 Visitor accounts in the database$/ do
  User.create!(:email => "user1@testmail.com",:password => "user123", :password_confirmation => "user123")
  User.create!(:email => "user2@testmail.com", :password => "user2123", :password_confirmation => "user2123")
end


Then /^I should see a "([^\"]*)" in the status block$/ do |arg1|
  response.should contain(arg1)
end

Then /^I should see "([^\"]*)" in the same status block$/ do |arg1|
  response.should contain(arg1)
end

# with selected vehicles for the week
Given /^there are 1 vehicle selected for the week$/ do
  Vehicle.create!(:select_for_week => true, :modele => "Peugeot 206", :annee => (4.years.ago).to_date, :price => "3000", :kilometrage => "75000")
end

Then /^I should see the selected vehicle$/ do
  response.should contain("Peugeot 206 - Année : 2006 - 75000.00 km - 3000 €")
end

