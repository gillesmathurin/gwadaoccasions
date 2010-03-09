Feature: Browse WeekSelection

	In order to have more infos on the weekly selected vehicles
	As a visitor 
	I want to browse into this selection
	
	Scenario: No vehicles selected for the week
	Given I am on "the homepage"
	And There are no vehicles selected for the week
	Then I should see "Pas de véhicules sélectionnés cette semaine"