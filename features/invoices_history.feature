Feature: Invoices history
  In order to know how much i have paid for this service
  As a Provider
  I want to consult a list of my invoices

	Background: Provider is logged out
		Given I am not authenticated as provider

	Scenario: Listing my 3 invoices
	  Given I am a new, authenticated active provider
		And I have been subscribed since "3" months
		And I am on "provider_root_path" page
	  When I follow "Historique Abonnement"
	  Then I should be on "Historique Abonnement"
		And I should see "Transaction ID"
		And I should see "Status"
		And I should see "Date"
		And I should see "Montant"
		And I should see "paid"
		And I should see "85.00"
	
@focus	
	Scenario: Listing my 13 invoices
	  Given I am a new, authenticated active provider
		And I have been subscribed since "13" months
		And I am on "provider_root_path" page
	  When I follow "Historique Abonnement"
	  Then I should be on "Historique Abonnement"
		And I should see "Transaction ID"
		And I should see "Status"
		And I should see "Date"
		And I should see "Montant"
		And I should see "paid"
		And I should see "85.00"
		And I should see "Suivant"
	

  
