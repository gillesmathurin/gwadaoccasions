Feature: Visitor Search

	In order to find a vehicle that suits my needs
	As a visitor
	I want to use a search form to find vehicles
	
	Scenario: Find Voitures (cars) based on with price criteria
	Given I am on "the homepage"
	And There is a "Voiture" Category
	And There is car priced "6000" €
	And There is no vehicles of the week selection
	When I search for cars with price between 0 and 10 000 €
	Then I should see the car
	
	Scenario: Find Voitures (cars) based on Type, Price and Kilometers
	Given I am on "the homepage"
	And There is a "Voiture" Category
	And There is car priced "5000" € with "60000" km made
	When I search for "Voiture" priced between "2000" and "6000" € with at most "70 000 Km"
	Then I should see the car
	
	Scenario: Doesn't find Voitures (cars) which are out of the criterias scope
	Given I am on "the homepage"
	And There is a "Voiture" Category
	And There is car priced "5000" € with "60000" km made
	When I search for "Voiture" priced between "2000" and "6000" € with at most "20 000 Km"
	Then I should not see the car
	
