Given /^I have "([^\"]*)" vehicles$/ do |arg1|
  if arg1.to_i == 0
    @provider.vehicles.count == 0    
  else
    while arg1.to_i > 0
      Vehicle.make(:provider => @provider)
    end
  end
end

Given /^There are all Categories of vehicle$/ do
  %w(Voiture Moto Jetski Bateau).each { |c| Category.create(:name => c) }
end


When /^I select "([^\"]*)" the vehicle modele year$/ do |arg1|
  date = Date.parse(arg1)
  set_hidden_field 'vehicle_annee_2i', :to => date.month
  set_hidden_field 'vehicle_annee_3i', :to => date.day
  select(date.year, :from => 'vehicle_annee_1i')
end


Then /^I should have "([^\"]*)" vehicles$/ do |arg1|
  @provider.vehicles.count == arg1
end
