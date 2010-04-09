Feature: Subscriptions
  In order to market my vehicles on the website
  As a provider (vehicle seller)
  I want to susbcribe to the service

	Scenario: New Provider registration
	  Given I am not authenticated
	  When I follow "S'abonner"
	  Then I should be on "provider sign_up" page
	
	
	

  
