Feature: Browse WeekSelection

	In order to have direct infos on good vehicles
	As a visitor 
	I want to browse the weekly selection
	
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
	
	Scenario: Follow a vehicle of the week_selection link
		Given There is a car selected for the week
		And I enter the welcome page
		When I follow "Voir fiche"
		Then I should be on "a vehicle page"
	
	Scenario: Viewing a vehicle page (profile)
		Given There is a car selected for the week
		And I enter the welcome page
		When I follow "Voir fiche"
		Then I should be on "a vehicle page"
		And I should see a complete and detailed description of the vehicle
		And I should see a "Imprimez la fiche" link
		And I should see a "Sélectionnez" link
		And I should see a "Dites-le à un ami" link
