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

Then /^I should see the car$/ do
  response.should contain("#{@car.modele} - Année : #{@car.display_year} - #{@car.kilometrage} km - #{@car.price} €")
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




