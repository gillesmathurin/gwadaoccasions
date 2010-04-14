Feature: Invoices history
  In order to know how much i have paid for this service
  As a Provider
  I want to consult a list of my invoices

	Background: Provider is logged out
		Given I am not authenticated as provider
	
	Scenario: Listing my invoices
	  Given I am a new, authenticated active provider
		And I have been subscribed since "3" months
		And I am on "provider_root_path" page
	  When I follow "Historique des factures"
	  Then I should be on "my invoices history"
		# And I should see
	
	
	

  
