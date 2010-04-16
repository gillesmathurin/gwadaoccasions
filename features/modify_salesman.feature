Feature: Modify salesman
  In order to give accurate information so i can sell vehicles
  As a Provider
  I want to update information concerning salesmen

Background: Provider is logged in
	Given I am not authenticated as provider
  Given I am a new, authenticated active provider
	
	Scenario: Updating a salesman
	  Given I have "1" salesman
		And I am on "provider_root_path" page
	  When I follow "Commerciaux"
		And I am on "salesmen index" page
		And I follow "Modifier Infos"
	  Then outcome
	
	
	
