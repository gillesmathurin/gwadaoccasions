Feature: Modify salesman
  In order to give accurate information so i can sell vehicles
  As a Provider
  I want to update information concerning salesmen

Background: Provider is logged in
	Given I am not authenticated as provider
  Given I am a new, authenticated active provider

	Scenario: Going to the provider's salesmen list
	  Given I have "1" salesman
		And I am on "provider_root_path" page
	  When I follow "Commerciaux"
	  Then I should be on "salesmen index" page
		And I should see "Antonio Ramon"
		And I should see "0000-000-000"
		And I should see "Modifier"
		And I should see "Supprimer"
		
	Scenario: Updating salesman information
	  Given I have "1" salesman
		And I am on "provider_root_path" page
	  And I follow "Commerciaux"
	  And I am on "salesmen index" page
		When I follow "Modifier"
		And I fill in the following:
			| Nom	| Antonio Ramon	|
			|	Tel. Portable	|	0690911748	|
		And I press "Modifier"
		Then I should be on "salesmen index" page
		And I should see "Antonio Ramon"
		And I should see "0690-911-748"
	
@focus	
	Scenario: Delete a salesman
	  Given I have "1" salesman
		And I am on "provider_root_path" page
	  And I follow "Commerciaux"
	  And I am on "salesmen index" page
		When I follow "Supprimer"
		Then I should be on "salesmen index" page
		And I should have "0" salesman
		And I should see "Pas de commerciaux enregistrés"
	
	
	
	
	
		
	
	
	
