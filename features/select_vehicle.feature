Feature: Select vehicle
  In order to retrieve easily interesting vehicles
  As a Visitor
  I want to keep track of them by selecting them

	Scenario: As a visitor
		Given there are vehicles of each type in the database
	  And I am on "a vehicle page"
	  When I follow "Sélectionnez"
	  Then I should be on "sign_in" page
	
	Scenario: As a registered and logged in user
	  Given there are vehicles of each type in the database
		And I am logged in
		And I have "0" selected vehicles
		And I am on "a vehicle page"
	  When I follow "Sélectionnez"
	  Then I should see "Véhicule ajouté à votre selection" within ".flashnotice"
		And I should have "1" selected vehicles

	Scenario: As a registered but logged out user
		Given there are vehicles of each type in the database
	  And I am on "a vehicle page"
	  When I follow "Sélectionnez"
	  Then I should be on "sign_in" page
	

 

	
	
	
	
	

  
