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
  minprice { price }
  maxprice { minprice + 10000 }
  annee { (Date.parse("1960-01-01")..Date.today).to_a.rand }
  kilometrage { (0..200000).to_a.rand }
  minkilometer { kilometrage }
  maxkilometer { minkilometer + 20000 }
  serialnumber { String.random_alphanumeric }
  immatriculation { String.random_alphanumeric(8) }
  energy(:unique => false) { Vehicle::ENERGY.rand }
  boite_vitesse(:unique => false) { Vehicle::VITESSE.rand }
  cylindree { [0, 50, 75, 100, 150, 200, 250, 500, 750, 1000, 1500].rand }
  email { Faker::Internet.email }
  password(:unique => false) { pass }
  password_confirmation(:unique => false) {pass}
  category(:unique => false) { ["Voiture", "Moto", "Jetski", "Bateau"].rand() }
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

SearchProfile.blueprint do
  category
  minprice
  maxprice
  minkilometer
  maxkilometer
end

Provider.blueprint do
  email
  password
  password_confirmation
  login { "login" }
  company { "MyCompany" }
  telephone { "0000000000" }
  fax { "0000000000" }
  mobile { "0000000000" }
  address { "adresse" }
  zipcode { "97180" }
  city { "Sainte-Anne" }
  state { "Guadeloupe" }
  contact_name { Faker::Name.name }
  status { "pending" }
end

Plan.blueprint do
  nom { "Standard" }
  price { 8500 }
end

Subscription.blueprint do
  provider_id {  }
  plan_id {  }
  status { "pending" }
end

PaymentNotification.blueprint do
  # subscription_id {}
  params { {:mc_gross => "85.00"} }
  created_at { Time.now }
  status { "paid" }
  transaction_id { String.random_alphanumeric(8) }
end

Salesman.blueprint do
  name { Faker::Name.name }
  mobile_phone { Faker::PhoneNumber.phone_number }
end