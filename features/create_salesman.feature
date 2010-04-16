Feature: Create Salesman
  In order to sell vehicles
  As a Provider
  I want to create salesman

Background: Provider is logged in
	Given I am not authenticated as provider
  Given I am a new, authenticated active provider
	
	Scenario: Create a Salesman
		Given I have "0" salesman
		And I am on "provider_root_path" page
	  When I follow "Ajouter un Commercial"
		And I am on "new salesman" page
	  And I fill in the following:
				| Nom					| John Smith 	|
				|	Tel. portable	| 0690898237	|
		And I press "Enregistrer"
		Then I should have "1" salesman
		And I should be on "provider_root_path" page
		And I should see "Nombre de commerciaux : 1"
	
	Scenario: Create one more Salesman
		Given I have "1" salesman
		And I am on "provider_root_path" page
	  When I follow "Ajouter un Commercial"
		And I am on "new salesman" page
	  And I fill in the following:
				| Nom					| John Doe 	|
				|	Tel. portable	| 0690898237	|
		And I press "Enregistrer"
		Then I should have "1" salesman
		And I should be on "provider_root_path" page
		And I should see "Nombre de commerciaux : 2"
		
	Scenario: Create a duplicate salesman
		Given I have "1" salesman
		And I am on "provider_root_path" page
	  When I follow "Ajouter un Commercial"
		And I am on "new salesman" page
	  And I fill in the following:
				| Nom					| Antonio Ramon 	|
				|	Tel. portable	| 0000000000	|
		And I press "Enregistrer"
		Then I should have "1" salesman
		And I should see "2 errors prohibited this salesman from being saved"
		And I should see "Name doit être unique"
		And I should see "Mobile phone doit être unique"
	
	
	