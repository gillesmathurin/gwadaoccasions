Given /^I have "([^\"]*)" salesman$/ do |arg1|
  if arg1.to_i == 0
    @provider.salesmen.count == arg1    
  else
    arg1.to_i.times do
      Salesman.make(:provider => @provider)
    end
  end
end

Then /^I should have "([^\"]*)" salesman$/ do |arg1|
  @provider.salesmen.count == arg1
end