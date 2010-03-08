require 'machinist/active_record'
require 'sham'
require 'faker'

Given /^A car with a 6000 € price$/ do
  Car.make(:price => 6000)
end

When /^I search for cars with price between 0 and 10 000 €$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should find the car$/ do
  pending # express the regexp above with the code you wish you had
end