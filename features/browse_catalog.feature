Feature: Browse Catalog
	As a Visitor
	In order to discover and see all the vehicles available
	I want to browse the catalog of vehicles
	
	Scenario: with all types of vehicles
		Given I am on the homepage page
		And there are vehicles of each type in the database
		When I follow "Catalogue"
		Then I should see a list of Voiture, Moto, Jetski, Boat vehicles 
	
	Scenario: with 15 items by page
		Given I am on the homepage
		And There are "30" vehicles in the database
		When I follow "Catalogue"
		Then I should see 15 vehicles listed
		And I should see a "Suivant" link
		And I should see "Précédent"
		
	Scenario: without vehicles
		Given I am on the homepage
		And There aren't any vehicles in the database
		When I follow "Catalogue"
		Then I should see "Pas d'offres pour le moment."