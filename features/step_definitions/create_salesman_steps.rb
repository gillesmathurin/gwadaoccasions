Given /^I have "([^\"]*)" salesman$/ do |arg1|
  if arg1.to_i == 0
    @provider.salesmen.count == arg1    
  else
    arg1.to_i.times do
      Salesman.make(:provider => @provider, :name => "Antonio Ramon", :mobile_phone => "0000000000")
    end
  end
end

Then /^I should have "([^\"]*)" salesman$/ do |arg1|
  @provider.salesmen.count == arg1
end