require 'machinist/active_record'
require 'sham'
require 'faker'


Given /^There is a "([^\"]*)" Category$/ do |category|
  Category.create!(:name => category)
end

Given /^There is car priced "([^\"]*)" €$/ do |arg1|
  @car = Voiture.make(:price => arg1, :modele => "Peugeot 206")
end

Given /^There is no vehicles of the week selection$/ do
  @vehicles_of_the_week = []
end

Given /^I am on the root page$/ do
  visit root_path
end

When /^I search for cars with price between 0 and 10 000 €$/ do
  visit root_path
  select "Voiture", :from => "search_category"
  select "1000", :from => "search_minprice"
  select "10000", :from => "search_maxprice"
  click_button "Chercher"  
end

Then /^I should see the car description in the results$/ do
  response.should contain("#{@car.modele} - Année : #{@car.display_year} - #{format_km(@car.kilometrage)} - #{@car.price} €")
  response.should have_link(vehicle_path(@car))
end

Then /^I should see the car in the results$/ do
  response.should contain("#{@car.modele} - Année : #{@car.display_year} - 60000.00 km - #{@car.price} €")
  response.should have_link(vehicle_path(@car))
end

# 2nd scenario :
Given /^There is car priced "([^\"]*)" € with "([^\"]*)" km made$/ do |arg1, arg2|
  @car = Voiture.make(:price => arg1, :kilometrage => arg2, :modele => "Toyota Yaris")
end


When /^I search for "([^\"]*)" priced between "([^\"]*)" and "([^\"]*)" € with at most "([^\"]*)"$/ do |arg1, arg2, arg3, arg4|
  visit root_path
  select arg1, :from => "search_category"
  select arg2, :from => "search_minprice"
  select arg3, :from => "search_maxprice"
  select arg4, :from => "search_maxkilometrage"
  click_button "Chercher"
end

#3rd scenario
Then /^I should not see the car in the results$/ do
  response.should contain("Pas de résultats")
  response.should_not have_link(vehicle_path(@car))  
end

#4th scenario
Given /^There is a motorbike priced "([^\"]*)" € with "([^\"]*)" km made$/ do |arg1, arg2|
  @motorbike = Moto.make(:price => arg1, :kilometrage => arg2)
end

Then /^I should see the motorbike in the results$/ do
  response.should contain("#{@motorbike.modele} - Année : #{@motorbike.display_year} - 50000.00 km - #{@motorbike.price} €")
  response.should have_link(vehicle_path(@motorbike))
end

#5th scenario :jetski
Given /^There is a Jetski priced "([^\"]*)" € with "([^\"]*)" km made$/ do |arg1, arg2|
  @jetski = Jetski.make(:price => arg1, :kilometrage => arg2)
end

When /^I search for "([^\"]*)" priced between "([^\"]*)" and "([^\"]*)" €$/ do |arg1, arg2, arg3|
  visit root_path
  select arg1, :from => "search_category"
  select arg2, :from => "search_minprice"
  select arg3, :from => "search_maxprice"
  click_button "Chercher"
end

Then /^I should see the jetski in the results$/ do
  response.should contain("#{@jetski.modele} - Année : #{@jetski.display_year} - 50000.00 km - #{@jetski.price}")
  response.should have_link(vehicle_path(@jetski))
end

#6th scenario : boats search
Given /^There is a Bateau priced "([^\"]*)" €$/ do |arg1|
  @boat = Bateau.make(:price => arg1)
end

Then /^I should see the bateau in the results$/ do
  response.should contain("#{@boat.modele} - Année : #{@boat.display_year} - - #{@boat.price} €")
  response.should have_link(vehicle_path(@boat))
end


