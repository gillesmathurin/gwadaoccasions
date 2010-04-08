Feature: Tell a friend
  In order to inform friends of good opportunities
  As a Visitor
  I want to send them by email vehicle profiles i found interesting

	Scenario: Sending a car profile
		Given there are vehicles of each type in the database
  	And I am on "a vehicle page"
	  When I follow "Dites-le à un ami"
		And I fill in "from_email" with "monemail@bar.com"
		And I fill in "friend_email" with "foo@bar.com"
		And I press "Envoyer"
	  Then I should see "Email envoyé à votre ami."
	
	
	

  
