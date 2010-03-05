Feature: Welcome

	In order to welcome people to my website
	As a visitor
	I want to see a welcome page containing general information about the site
	I want to see a search form helping me find vehicles that suit my need
	
	Scenario: Welcome new visitors on a blank website (with nothing in the database and no visitor accounts)
		Given I have not visited the site
		And there is no Vehicle
		When I enter the welcome page
		Then I should see a menu bar
		And I should see a "Enregistrez vos profils de recherche et recevez quotidiennement les offres correspondantes" 
		# And I should see a search form
		And I should see a "0 offre" in a text-block 
		And I should see a "0 compte visiteur" in a text-block
		And I should see a "Vous êtes un professionel ?" text
		And I should see a "Découvrez nos services" link
		And I should see a "Vous êtes un particulier ?" in the page
		And I should see a "Publiez gratuitement vos annonces" link
		And I should see a "La sélection de la semaine" text
		And I should see a "Pas d'offres pour le moment" message

		