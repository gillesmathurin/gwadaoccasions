Feature: Subscriptions
  In order to market my vehicles on the website
  As a provider (vehicle seller)
  I want to susbcribe to the service

	Scenario: New Provider registration
	  Given I am not authenticated
	  When I follow "Abonnez vous"
	  Then I should be on "provider sign_up" page
	
@focus
	Scenario: Fill in the provider registration form correctly
	  Given I am not authenticated
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
		And I press "Souscrire"
		Then I should have "1" provider
	  And I should be on "provider_root_path" page
	
	
	
	
	

  
