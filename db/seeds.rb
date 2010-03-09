Category.delete_all
# Creation des categories
a = ["Voiture", "Moto", "Jetski", "Bateau"]
a.each do |e|
  Category.create!(:name => e)
end

#Creation d'une voiture
Voiture.create!(:annee => 2009,
:immatriculation => "value for immatriculation",
:kilometrage => 20000,
:modele => "value for modele",
:energy => "value for energy",
:boite_vitesse => "value for boite_vitesse",
:price => 6000)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
