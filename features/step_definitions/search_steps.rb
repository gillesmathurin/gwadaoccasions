require 'machinist/active_record'
require 'sham'
require 'faker'

Given /^a Voiture Category$/ do
  Category.create!(:name => "Voiture")
end

Given /^A car with a 6000 € price$/ do
  @car = Car.make(:price => 6000)
end

When /^I search for cars with price between 0 and 10 000 €$/ do
  visit root_path
  select "Voiture", :from => "search_category"
  select "0", :from => "search_minprice"
  select "10000", :from => "search_maxprice"
  click_button 
end

Then /^I should find the car$/ do
  response.should have_selector(".search_results") do |selector|
    selector.should contain("Résultats de votre recherche")
    selector.should have_selector(".result") do |result|
      result.should contain("#{@car.modele} - #{@car.display_year}")
    end
  end
end