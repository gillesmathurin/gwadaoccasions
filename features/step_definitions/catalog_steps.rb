Given /^there are vehicles of each type in the database$/ do
  @car = Voiture.make()
  @moto = Moto.make()
  @jetski = Jetski.make()
  @boat = Bateau.make()
end

Then /^I should see a list of "([^\"]*)", "([^\"]*)", "([^\"]*)" and "([^\"]*)" vehicles$/ do |voiture, moto, jetski, bateau|
  pending # express the regexp above with the code you wish you had
end