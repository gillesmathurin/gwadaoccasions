Given /^I have "([^\"]*)" selected vehicles$/ do |arg1|
  @user.vehicles.count == arg1
end

Given /^I have already selected this vehicle$/ do
  @user.vehicles << Vehicle.first
end

Given /^I have a selected vehicle$/ do
  @user.vehicles << Vehicle.first
end


Then /^I should have "([^\"]*)" selected vehicles$/ do |arg1|
  @user.vehicles.count == arg1
end

