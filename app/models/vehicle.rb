class Vehicle < ActiveRecord::Base
  default_scope :order => "price asc"
  validates_presence_of :annee, :on => :create, :message => "doit être renseignée"
  
  belongs_to :category
  has_attached_file :overviewpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :frontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :backpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :rfrontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :lfrontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :rbackpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :lbackpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
    
  # Constantes
  PRICE = [["0", "0"], ["250", "250"], ["500", "500"], ["1000", "1000"], ["1500", "1500"], ["2000", "2000"], ["2500", "2500"], ["3000", "3500"], ["4000", "4000"], ["5000", "5000"], ["6000", "6000"], ["7000", "7000"], ["8000", "8000"], ["9000", "9000"], ["10000", "10000"], ["15000", "15000"], ["20000","20000"], ["25000", "25000"], ["30000", "30000"], ["40000", "40000"], ["50000", "50000"]]
  
  KILOMETRAGE = [["10 000 Km", "10000"], ["20 000 Km", "20000"], ["30 000 Km", "30000"], ["50 000 Km", "50000"], ["70 000 Km", "70000"], ["100 000 Km", "100000"], ["150 000 Km", "150000"], ["200 000 Km", "200000"]]
  
  ENERGY = [["Essence", "Essence"], ["Diesel", "Diesel"], ["Electrique", "Electrique"]]
  
  VITESSE = [["Manuel", "Manuel"], ["Automatique", "Automatique"]]
  
  #methodes
  named_scope :of_the_week, :conditions => ['select_for_week = ?', true]
  
  def display_year
    self.annee.try(:year)
  end
end
