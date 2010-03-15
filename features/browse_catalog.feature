Feature: Browse Catalog
	As a Visitor
	In order to discover and see all the vehicles available
	I want to browse the catalog of vehicles
	
	Scenario: Searching the cars
		Given I am on the homepage page
		And there are 2 Vehicles in the database
		When I follow "Catalogue"
		Then I should see a list of "Voiture"
	