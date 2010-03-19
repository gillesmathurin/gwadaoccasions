require 'machinist/active_record'
require 'sham'
require 'faker'

def String.random_alphanumeric(size=16)
  s = ""
  size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  s
end

def pass
  s ||= "secretpass"
end

Sham.define do
  modele  { Faker::Name.name }
  description  { Faker::Lorem.paragraph }
  price { rand(50000) }
  annee { (Date.parse("1960-01-01")..Date.today).to_a.rand }
  kilometrage { (0..200000).to_a.rand }
  serialnumber { String.random_alphanumeric }
  immatriculation { String.random_alphanumeric(8) }
  energy(:unique => false) { Vehicle::ENERGY.rand }
  boite_vitesse(:unique => false) { Vehicle::VITESSE.rand }
  cylindree { [0, 50, 75, 100, 150, 200, 250, 500, 750, 1000, 1500].rand }
  email { Faker::Internet.email }
  password(:unique => false) { pass }
  password_confirmation(:unique => false) {pass}
end

Vehicle.blueprint do
  modele
  description
  price
  annee
end

Voiture.blueprint do
  modele
  description
  price
  annee
  kilometrage
  immatriculation
  energy
  boite_vitesse
end

Moto.blueprint do
  modele
  description
  price
  annee
  kilometrage
  immatriculation
  boite_vitesse
  cylindree
end

Jetski.blueprint do
  modele
  description
  price
  annee
  kilometrage
end

Bateau.blueprint do
  modele
  description
  price
  annee
end

User.blueprint do
  email
  password
  password_confirmation
  confirmed_at {Time.now}
end