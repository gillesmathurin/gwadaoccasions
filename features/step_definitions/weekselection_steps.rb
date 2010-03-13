Given /^There are no vehicles selected for the week$/ do
  @vehicles_of_the_week = []
end

Given /^There is a car selected for the week$/ do
  @car = Voiture.make(:select_for_week => true, :kilometrage => 127000)
end

Given /^There is a Moto selected for the week$/ do
  @moto = Moto.make(:select_for_week => true, :kilometrage => 55000)
end

Then /^I should see the car overview description$/ do
  response.should have_selector(".week_selection") do |selector|
    selector.should have_selector("img.overview")
    selector.should contain("#{@car.modele} - Année : #{@car.display_year} - 127000.00 km - #{@car.price}")
  end
end

Then /^I should see the moto overview description$/ do
  response.should have_selector(".week_selection") do |selector|
    selector.should have_selector("img.overview")
    selector.should contain("#{@moto.modele} - Année : #{@moto.display_year} - 55000.00 km - #{@moto.price}")
  end
end

Then /^I should see a complete and detailed description of the vehicle$/ do
  response.should have_selector(".vehicle_description") do |selector|
    selector.should have_selector(".gallery") do |photo|
      photo.should have_selector("img", :src => @car.overviewpic.url(:large))
    end
  end
end


