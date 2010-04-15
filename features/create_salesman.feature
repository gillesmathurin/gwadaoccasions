Feature: Create Salesman
  In order to sell vehicles
  As a Provider
  I want to create salesman

Background: Provider is logged in
	Given I am not authenticated as provider
  Given I am a new, authenticated active provider
	
@focus
	Scenario: Create a Salesman
		Given I have "0" salesman
		And I am on "provider_root_path" page
	  When I follow "Ajouter un Commercial"
		And I am on "new salesman" page
	  And I fill in the following:
				| name					| John Smith 	|
				|	mobile_phone	| 0690898237	|
		And I press	"Enregistrer"
		Then I should have "1" salesman
		And I should be on "provider_root_path" page
		And I should see "Nombre de commerciaux : 1"
	
	Scenario: Create one more Salesman
		Given I have "1" salesman
		And I am on "provider_root_path" page
	  When I follow "Ajouter un Commercial"
		And I am on "new salesman" page
	  And I fill in the following:
				| name					| John Doe 	|
				|	mobile_phone	| 0690898237	|
		And I press	"Enregistrer"
		Then I should have "1" salesman
		And I should be on "provider_root_path" page
		And I should see "Nombre de commerciaux : 1"