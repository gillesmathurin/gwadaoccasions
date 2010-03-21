Feature: Register user
  In order to keep my personnal useful informations
  As a Visitor
  I want to create an account

	Scenario: Creating a new account	
	  Given I am not authenticated
	  When I go to register
		And I fill in "user_email" with "testing@man.net"
		And I fill in "user_password" with "secretpass"
		And I fill in "user_password_confirmation" with "secretpass"
		And I press "Sign up"
		Then I am redirected to "/users/sign_in?unconfirmed=true"
	  And I should see "You have to confirm your account before continuing."

	
	Scenario Outline: Creating a new account	
	  Given I am not authenticated
	  When I go to register
		And I fill in "user_email" with "<email>"
		And I fill in "user_password" with "<password>"
		And I fill in "user_password_confirmation" with "<password>"
		And I press "Sign up"
		Then I am redirected to "/users/sign_in?unconfirmed=true"
	  And I should see "You have to confirm your account before continuing."
	
		Examples:
			| email						|	password			|
			| testing@man.net	|	secretpass		|
			|	foo@bar.com			|	fr33z3				|


  Scenario Outline: Logging in
		Given I am not authenticated
		And I have one user "<email>" with password "<password>"
		When I go to login
	  And I fill in "user_email" with "<email>"
	  And I fill in "user_password" with "<password>"
	  And I press "Sign in"
		Then I should be on "user_root_path"
		And I should see "Signed in successfully."
		And I should see "Deconnexion"
		
		Examples:
			| email						|	password			|
			| testing@man.net	|	secretpass		|
			|	foo@bar.com			|	fr33z3				|
			
			
	Scenario: Logging out from the homepage	
	  Given I am a new, authenticated user
		And I am on the homepage
	  When I follow "Deconnexion"
	  Then I should see "Connexion"
		And I should not see "Deconnexion"
		And I should be on "the homepage"
		
	Scenario: Logging out from a user profile page
	  Given I am a new, authenticated user
		And I am on my user profile page
	  When I follow "Deconnexion" 
		Then I should be on the homepage
		
	
	
	
	
	
	
	
	
	
