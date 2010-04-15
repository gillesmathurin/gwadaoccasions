Given /^I have "([^\"]*)" salesman$/ do |arg1|
  if arg1.to_i == 0
    @provider.salesmans.count == arg1    
  else
    arg1.to_i.times do
      Salesman.make(:provider => @provider)
    end
  end
end

When /^I press\t"([^\"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should have "([^\"]*)" salesman$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end