Feature: Visitor Search

	In order to find a vehicle that suits my needs
	As a visitor
	I want to use a search form to find vehicles
	
	Scenario: Looking for cars with price criteria
	Given A Voiture Category
	And A car with a 6000 € price
	And There is no vehicles of the week selection
	When I search for cars with price between 0 and 10 000 €
	Then I should open the page
	And I should see the car
	
