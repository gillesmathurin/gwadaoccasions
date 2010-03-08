Feature: Search

	In order to find a vehicle that suits my needs
	As a visitor
	I want to use a search form to find vehicles
	
	Scenario: Looking for cars with price criteria
	Given a Voiture Category
	And A car with a 6000 € price
	When I search for cars with price between 0 and 10 000 €
	Then I should find the car
	
