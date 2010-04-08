Feature: Users search profiles
  In order to quickly find vehicles based on sets of criterias
  As a registered user
  I want to record and manage search profiles

	Scenario Outline: Create a search profile
	  Given I am a new, authenticated user
		And I am on my user profile page
	  When I follow "Ajouter un profil de recherche"
	 	And I fill in "search_profile_category" with "<category>"
		And I fill in "search_profile_minprice" with "<minprice>"
		And I fill in "search_profile_maxprice" with "<maxprice>"
		And I fill in "search_profile_minkilometer" with "<minkilometer>"
		And I fill in "search_profile_maxkilometer" with "<maxkilometer>"
		And I press "Enregistrer le profil"
	  Then I should see "Profil de recherche enregistré."
		And I should be on my user profile page
	
		Examples:
			| category	| minprice	|	maxprice |	minkilometer |	maxkilometer |
			|	Voiture		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Moto			|	4000			|	6000		 |	50000				 |	120000			 |
			|	Jetski		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Bateau		|	4000			|	8000		 |							 |							 |		

	
	Scenario Outline: Modify a search profile
	  Given I am a new, authenticated user
		And I have a search profile for a "Voiture" within "3000" and "6000"
		And I am on my user profile page
	  When I follow "Modifier le profil"
		And I fill in "search_profile_category" with "<category>"
		And I fill in "search_profile_minprice" with "<minprice>"
		And I fill in "search_profile_maxprice" with "<maxprice>"
		And I press "Modifier le profil"
		Then I should see "Profil de recherche modifié."
		And I should be on my user profile page
		
		Examples:
			| category	| minprice	|	maxprice |	minkilometer |	maxkilometer |
			|	Voiture		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Moto			|	4000			|	6000		 |	50000				 |	120000			 |
			|	Jetski		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Bateau		|	4000			|	8000		 |							 |							 |		
	

	Scenario: Delete a search profile
	  Given I am a new, authenticated user
		And I have a search profile for a "Voiture" within "3000" and "6000"
		And I am on my user profile page
	  When I follow "Supprimer le profil"
		Then I should see "Profil de recherche supprimé."
		And I should see "Vous n'avez pas encore de profils de recherche enregistrés."
	
		
	Scenario Outline: Create at most 5 search profiles
	  Given I am a new, authenticated user
		And I already have 5 search profiles
		And I am on my user profile page
	  When I follow "Ajouter un profil de recherche"
	 	And I fill in "search_profile_category" with "<category>"
		And I fill in "search_profile_minprice" with "<minprice>"
		And I fill in "search_profile_maxprice" with "<maxprice>"
		And I fill in "search_profile_minkilometer" with "<minkilometer>"
		And I fill in "search_profile_maxkilometer" with "<maxkilometer>"
		And I press "Enregistrer le profil"
	  Then I should see "Vous avez atteint le nombre maximum de profils. Veuillez modifier un profil existant."
		
		Examples:
			| category	| minprice	|	maxprice |	minkilometer |	maxkilometer |
			|	Voiture		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Moto			|	4000			|	6000		 |	50000				 |	120000			 |
			|	Jetski		|	4000			|	8000		 |	50000				 |	120000			 |
			|	Bateau		|	4000			|	8000		 |							 |							 |		
	
			
	Scenario: Create at most 5 search profiles
	  Given I am a new, authenticated user
		And I already have 5 search profiles
		And I am on my user profile page
	  When I follow "Ajouter un profil de recherche"
	 	And I fill in "search_profile_category" with "Voiture"
		And I fill in "search_profile_minprice" with "4000"
		And I fill in "search_profile_maxprice" with "8000"
		And I fill in "search_profile_minkilometer" with "50000"
		And I fill in "search_profile_maxkilometer" with "120000"
		And I press "Enregistrer le profil"
	  Then I should see "Vous avez atteint le nombre maximum de profils. Veuillez modifier un profil existant."

	
	
	Scenario: Lead to matching vehicles
		Given there are vehicles of each type in the database
	  And I am a new, authenticated user
		And I have a search profile for a "Voiture" within "3000" and "7000"
		And I am on my user profile page
		Then I should see vehicle(s) in the compatible vehicles list
	
	
	
	
	
	
	
  
