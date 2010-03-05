class Vehicle < ActiveRecord::Base
  belongs_to :category
  PRICE = [["1000", "1000"], [""]]
  KILOMETRAGE = [["1000", "1000"], [""]]
  ENERGY = [["Essence", "Essence"], ["Diesel", "Diesel"], ["Electrique", "Electrique"]]
  VITESSE = [["Manuel", "Manuel"], ["Automatique", "Automatique"]]
  
  named_scope :of_the_week, :conditions => ['select_for_week = ?', true]    
end
