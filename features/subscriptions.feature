Feature: Subscriptions
  In order to market my vehicles on the website
  As a provider (vehicle seller)
  I want to susbcribe to the service

	Background: Provider is logged out
		Given I am not authenticated as provider
		
	Scenario: New Provider registration
	  When I follow "Abonnez vous"
	  Then I should be on "provider sign_up" page
	
	
	Scenario: Step 1 - filling in the provider registration form correctly
		And there are no providers yet
	  When I follow "Abonnez vous"
		And I fill in the following:
			|	provider_company 	| mycompany |
			|	provider_address	|	myaddress	|
			|	provider_zipcode	|	97180			|
			|	provider_city			|	Sainte-Anne	|
			|	provider_state		|	Guadeloupe	|
			|	provider_telephone	|	0590898237	|
			|	provider_fax			|	0590853357	|
			|	provider_mobile		|	0690911748	|
			|	provider_contact_name	|	Gilles MATHURIN	|
			| provider_login		|	gillesmath	|
			| provider_email		| foobar@mail.com	|
			| provider_password	|	carmen30	|
			| provider_password_confirmation | carmen30|
		And I press "Enregistrer"
		Then I should have "1" provider
	  And I should be on "provider_root_path" page
	

	Scenario: Step 2 - choosing the subscription plan
	  And I am a new, authenticated pending provider
		And There is a subscription plan
		And I am on "provider_root_path" page 
	  When I choose to create a "Standard" plan
		And I press "Souscrire"
		Then I should have a pending subscription
	  And I should be on "subscription show" page
	
@focus
	Scenario: Step 3 - Proceeding to payment
	  And I am a new, authenticated pending provider
		And There is a subscription plan
		And I am on "provider_root_path" page 
		And I press "Souscrire"
		And I have a pending subscription
		And I am on "subscription show" page 
	  When I press "Payer sur paypal"
	  Then I should have a paid subscription
		And I should have an active provider account
		And I should be on "congrats" page
	
	
	
	
	
	
	
	
	
	
	

  
