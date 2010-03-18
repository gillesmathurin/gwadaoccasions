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
		Then I should be on the root page
	  Then I should see "You have signed up successfully."
		# 
		# Examples:
		# 	| email						|	password			|
		# 	| testing@man.net	|	secretpass		|
		# 	|	foo@bar.com			|	fr33z3				|
	
	
	

  
