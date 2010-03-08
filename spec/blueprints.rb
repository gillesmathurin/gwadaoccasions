require 'machinist/active_record'
require 'sham'
require 'faker'

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end

Sham.define do
  modele  { Faker::Lorem.words }
  description  { Faker::Lorem.paragraph }
  price { rand(50000) }
  annee { (1960..Date.today.year).to_a.rand }
  kilometrage { (0..200000).to_a.rand }
  serialnumber { String.random_alphanumeric }
  immatriculation { String.random_alphanumeric(8) }
  energy { Vehicle::ENERGY.rand }
  boite_vitesse { Vehicle::VITESSE.rand }
end

Vehicle.blueprint do
  modele
  description
  price
  annee
end

Car.blueprint do
  modele
  description
  price
  annee
  kilometrage
  immatriculation
  energy
  boite_vitesse
end