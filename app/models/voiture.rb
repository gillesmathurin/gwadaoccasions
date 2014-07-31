class Voiture < Vehicle
  validates :modele, presence: true, on: :create
  validates :price, presence: true, on: :create
  validates :kilometrage, presence: true, on: :create
  validates :energy, presence: true, on: :create
  validates :boite_vitesse, presence: true, on: :create
end
