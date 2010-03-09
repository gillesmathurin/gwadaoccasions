require 'machinist/active_record'
require 'sham'
require 'faker'

Given /^A Voiture Category$/ do
  Category.create!(:name => "Voiture")
end

Given /^A car with a 6000 € price$/ do
  @car = Voiture.make(:price => 6000, :modele => "Peugeot 206")
end

Given /^There is no vehicles of the week selection$/ do
  @vehicles_of_the_week = []
end

When /^I search for cars with price between 0 and 10 000 €$/ do
  visit root_path
  select "Voiture", :from => "search_category"
  select "1000", :from => "search_minprice"
  select "10000", :from => "search_maxprice"
  click_button "Chercher"  
end

Then /^I should open the page$/ do
end

Then /^I should see the car$/ do
  # response.should have_selector(".search_results") do |selector|
  #   selector.should have_selector("div.result") do |div|
  #     div.should contain("#{@car.modele} - Annee : #{@car.display_year}")
  #   end
  # end
  response.should contain("#{@car.modele} - Année : #{@car.display_year} - #{@car.kilometrage} km - #{@car.price} €")
end