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

@focus	
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
	  Given context
	  When event
	  Then outcome
	
	Scenario: Create at most 5 search profiles
	  Given context
	  When event
	  Then outcome
	
	
	
	
	
	
	
	
	
	
	
	
	
  
