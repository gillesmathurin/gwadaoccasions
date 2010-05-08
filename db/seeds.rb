Category.delete_all
# Creation des categories
a = ["Voiture", "Moto", "Jetski", "Bateau"]
a.each do |e|
  Category.create!(:name => e)
end

#Creation d'une voiture
# Voiture.create!(:annee => 1.year.ago,
# :immatriculation => "value for immatriculation",
# :kilometrage => 20000,
# :modele => "value for modele",
# :energy => "value for energy",
# :boite_vitesse => "value for boite_vitesse",
# :price => 6000)

