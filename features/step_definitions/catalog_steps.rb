Given /^there are vehicles of each type in the database$/ do
  @car = Voiture.make(:price => 6000)
  @moto = Moto.make(:price => 4000)
  @jetski = Jetski.make(:price => 5000)
  @boat = Bateau.make(:price => 7000)
end

Then /^I should see a list of Voiture, Moto, Jetski, Boat vehicles$/ do
  response.should contain("Toutes les offres classées par prix croissant")
  response.should have_selector(".vehicles_list") do |selector|
    selector.should have_selector("p", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @car.overviewpic.url(:thumb))
      paragraph.should contain("#{@car.modele} - Année : #{@car.display_year} - #{@car.price} €")
    end
    selector.should have_selector("p", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @moto.overviewpic.url(:thumb))
      paragraph.should contain("#{@moto.modele} - #{@moto.cylindree} cm3 - Année : #{@moto.display_year} - #{@moto.price} €")
    end
    selector.should have_selector("p", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @jetski.overviewpic.url(:thumb))
      paragraph.should contain("#{@jetski.modele} - Année : #{@jetski.display_year} - #{@jetski.price} €")
    end
    selector.should have_selector("p", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @boat.overviewpic.url(:thumb))
      paragraph.should contain("#{@boat.modele} - #{@boat.price} €")
    end
  end
end

Given /^There are "([^\"]*)" vehicles in the database$/ do |arg1|
  arg1.to_i.times { Voiture.make(:price => 6000) }
end

Then /^I should see 15 vehicles listed$/ do
  response.should have_selector("p", :class => "listitem", :count => 15)
end
