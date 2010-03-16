Given /^there are vehicles of each type in the database$/ do
  @car = Voiture.make(:price => 6000)
  @moto = Moto.make(:price => 4000)
  @jetski = Jetski.make(:price => 5000)
  @boat = Bateau.make(:price => 7000)
end

Then /^I should see a list of "([^\"]*)", "([^\"]*)", "([^\"]*)" and "([^\"]*)" vehicles$/ do |voiture, moto, jetski, bateau|
  response.should contain("Toutes les offres classées par prix croissant")
  response.should have_selector(".vehicles_list") do |selector|
    selector.should have_selector("p") do |paragraph|
      paragraph.should contain("#{@car.modele} - Année : #{@car.display_year} - #{@car.price} €")
    end
    selector.should have_selector("p") do |paragraph|
      paragraph.should contain("#{@moto.modele} - #{@moto.cylindree} cm3 - Année : #{@moto.display_year} - #{@moto.price} €")
    end
    selector.should have_selector("p") do |paragraph|
      paragraph.should contain("#{@jetski.modele} - Année : #{@jetski.display_year} - #{@jetski.price} €")
    end
    selector.should have_selector("p") do |paragraph|
      paragraph.should contain("#{@boat.modele} - #{@boat.price} €")
    end
  end
end