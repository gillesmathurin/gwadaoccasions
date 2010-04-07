Feature: Select vehicle
  In order to retrieve easily interesting vehicles
  As a Visitor
  I want to keep track of them by selecting them

	Scenario: As a visitor or a logged out user
		Given there are vehicles of each type in the database
	  And I am on "a vehicle page"
	  When I follow "Sélectionnez"
	  Then I should be on "sign_in" page
	
	Scenario: As a registered and logged in user
	  Given there are vehicles of each type in the database
		And I am a new, authenticated user
		And I have "0" selected vehicles
		And I am on "a vehicle page"
	  When I follow "Sélectionnez"
	  Then I should see "Véhicule ajouté à votre sélection"
		And I should have "1" selected vehicles
		
	Scenario: The logged in user has already selected
	  Given there are vehicles of each type in the database
		And I am a new, authenticated user
		And I am on "a vehicle page"
		And I have already selected this vehicle
	  When I follow "Sélectionnez"
	  Then I should see "Véhicule déjà présent dans votre sélection."
	
	Scenario: Deselect a vehicle
		Given there are vehicles of each type in the database
	  And I am a new, authenticated user
		And I have already selected this vehicle
		And I am on my user profile page
	  When I follow "Dé-selectionner"
	  Then I should see "Pas de véhicules sélectionnés"
		And I should have "0" selected vehicles
	
	
	
	

	

 

	
	
	
	
	

  
