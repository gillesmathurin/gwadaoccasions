Feature: Browse Catalog
	As a Visitor
	In order to discover and see all the vehicles available
	I want to browse the catalog of vehicles
	
	Scenario: with all types of vehicles
		Given I am on the homepage page
		And there are vehicles of each type in the database
		When I follow "Catalogue"
		Then I should see a list of "Voiture", "Moto", "Jetski" and "Bateau" vehicles 
	