require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  modele  { Faker::Lorem.words }
  description  { Faker::Lorem.paragraph }
  price { rand(50000) }
  annee { (1960..Date.today.year).map.rand }
end

Vehicle.blueprint do
  modele
  description
  price
  annee
end