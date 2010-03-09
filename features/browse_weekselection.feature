Feature: Browse WeekSelection

	In order to have more infos on the weekly selected vehicles
	As a visitor 
	I want to browse into this selection
	
	Scenario: No vehicles selected for the week
	Given I have not visited the site
	And There are no vehicles selected for the week
	When I enter the welcome page
	Then I should see "Pas de véhicules sélectionnés cette semaine"
	
	Scenario: With Selected for the week vehicles
	Given There is a car selected for the week
	And There is a Moto selected for the week
	When I enter the welcome page
	Then I should see the car overview description
	And I should see the moto overview description
	
	Scenario: Follow a selected for week vehicle
	Given
	When
	Then