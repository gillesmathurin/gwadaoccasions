Given /^there are vehicles of each type in the database$/ do
  @car = Voiture.make(:price => 6000)
  @moto = Moto.make(:price => 4000)
  @jetski = Jetski.make(:price => 5000)
  @boat = Bateau.make(:price => 7000)
end

Then /^I should see a list of Voiture, Moto, Jetski, Boat vehicles$/ do
  response.should contain("Toutes les offres classées par prix croissant")
  response.should have_selector(".vehicles_list") do |selector|
    selector.should have_selector("div", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @car.overviewpic.url(:thumb))
      paragraph.should contain("#{@car.modele}")
      paragraph.should contain("Année : #{@car.display_year}")
      paragraph.should contain("#{@car.price} €")
    end
    selector.should have_selector("div", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @moto.overviewpic.url(:thumb))
      paragraph.should contain("#{@moto.modele}")
      paragraph.should contain("Cylindrée : #{@moto.cylindree} cm3")
      paragraph.should contain("Année : #{@moto.display_year}")
      paragraph.should contain("#{@moto.price} €")
    end
    selector.should have_selector("div", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @jetski.overviewpic.url(:thumb))
      paragraph.should contain("#{@jetski.modele}")
      paragraph.should contain("Année : #{@jetski.display_year}")
      paragraph.should contain("#{@jetski.price} €")
    end
    selector.should have_selector("div", :class => "listitem") do |paragraph|
      paragraph.should have_selector("img", :src => @boat.overviewpic.url(:thumb))
      paragraph.should contain("#{@boat.modele}")
      paragraph.should contain("#{@boat.price} €")
    end
  end
end

Given /^There are "([^\"]*)" vehicles in the database$/ do |arg1|
  arg1.to_i.times { Voiture.make(:price => 6000) }
end

Then /^I should see 15 vehicles listed$/ do
  response.should have_selector("div", :class => "listitem", :count => 15)
end

Given /^There aren't any vehicles in the database$/ do
  @vehicles = []
end

