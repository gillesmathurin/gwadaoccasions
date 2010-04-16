class Voiture < Vehicle
  validates_presence_of :modele, :price, :kilometrage, :energy, :boite_vitesse,
   :on => :create, :message => "can't be blank"
end
