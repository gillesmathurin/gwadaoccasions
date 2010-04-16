Feature: Create vehicles
  In order to sell vehicles
  As a Provider
  I want to add vehicles to the database

	Background: Provider is logged in
		Given I am not authenticated as provider
	  Given I am a new, authenticated active provider

  Scenario Outline: Create a vehicle of any type
    Given I have "0" vehicles
		And There are all Categories of vehicle
 		And I am on "provider_root_path" page
    When I follow "Ajouter un Vehicule"
		And I am on "new vehicle" page
		And I select "<type>" from "vehicle[type]"
		And I select "<annee>" the vehicle modele year
		And I fill in "vehicle_price" with "<price>"
		And I fill in "vehicle_modele" with "<modele>"
		And I fill in "vehicle_kilometrage" with "<kilometrage>"
		And I fill in "vehicle_immatriculation" with "<immatriculation>"
		And I fill in "vehicle_serialnumber" with "<serialnumber>"
		And I fill in "vehicle_cylindree" with "<cylindree>"
		And I fill in "vehicle_description" with "<description>"
		And I select "<energy>" from "Carburant"
		And I select "<boite_vitesse>" from "Type Boite de vitesse"
		And I press "Enregistrer"
    Then I should be on "provider's vehicles" page
		And I should have "1" vehicles
		
		Examples:
			| type		|	annee							|	price	|	modele 			| kilometrage | immatriculation | serialnumber | cylindree | energy | boite_vitesse | description |
			| Voiture	| Sat, 16 Apr 2005	| 6000 	| Peugeot 206	| 120000			| 940 AZH 971			|	IZNXEDBRTYU	 | 					 | Essence | Manuel				|	bon état		|
			| Moto	| Sat, 16 Apr 2005	| 6000 	| Peugeot 206	| 120000			| 940 AZH 971			|	IZNXEDBRTYU	 | 			750		 | Essence | Manuel				|	bon état		|
			| Jetski	| Sat, 16 Apr 2005	| 6000 	| Yamaha 206	| 120000			| 940 AZH 971			|	IZNXEDBRTYU	 | 		1000		 | Essence | Manuel				|	bon état		|
			| Bateau	| Sat, 16 Apr 2005	| 6000 	| | 120000			| 			|	IZNXEDBRTYU	 | 					 | Essence | Manuel				|	bon état		|				
  
  
  
