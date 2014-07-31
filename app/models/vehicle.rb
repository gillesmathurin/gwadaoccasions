class Vehicle < ActiveRecord::Base
  default_scope { order("price asc") }
  validates :annee, presence: true
  validates :serialnumber, presence: true, uniqueness: true
  validates :immatriculation, presence: true, uniqueness: true
  
  belongs_to :provider
  belongs_to :salesman
  belongs_to :category
  has_many :selections
  has_many :users, :through => :selections
  
  has_attached_file :overviewpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :frontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :backpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :rfrontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :lfrontpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :rbackpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  has_attached_file :lbackpic, :styles => {:thumb => "150x150>", :medium => "250x250>", :large => "450x450>"}
  
  # TODO : refactor this with newer twitter gem version
  # after_create :share_me
    
  # Constantes
  PRICE = [["0", "0"], ["250", "250"], ["500", "500"], ["1000", "1000"], ["1500", "1500"], ["2000", "2000"], ["2500", "2500"], ["3000", "3500"], ["4000", "4000"], ["5000", "5000"], ["6000", "6000"], ["7000", "7000"], ["8000", "8000"], ["9000", "9000"], ["10000", "10000"], ["15000", "15000"], ["20000","20000"], ["25000", "25000"], ["30000", "30000"], ["40000", "40000"], ["50000", "50000"]]
  
  KILOMETRAGE = [["10 000 Km", "10000"], ["20 000 Km", "20000"], ["30 000 Km", "30000"], ["50 000 Km", "50000"], ["70 000 Km", "70000"], ["100 000 Km", "100000"], ["150 000 Km", "150000"], ["200 000 Km", "200000"]]
  
  ENERGY = [["Essence", "Essence"], ["Diesel", "Diesel"], ["Electrique", "Electrique"], ["Hybride", "Hybride"]]
  
  VITESSE = [["Manuel", "Manuel"], ["Automatique", "Automatique"]]
  
  # Enums 
  enum energy_type: [:essence, :diesel, :electrique, :hybride]
  enum gear_box: [:manuel, :automatique]
  
  #Scopes
  scope :of_the_week, -> { where(select_for_week: true) }
  scope :sold, -> { where(disponibilite: false) }
  scope :available, -> { where(disponibilite: true) }
  scope :with_price_criterias, ->(type, minprice, maxprice) { where('type = ? AND price >= ? AND price <= ?', type, minprice, maxprice)}
  
  # TODO Move this into helper
  def display_year
    self.annee.try(:year)
  end
  
  # Fetches search_profiles based on vehicle price and kilometrage
  def matching_searchprofiles
    search_profiles = SearchProfile.with_price_and_kilometer_criterias(self.price, self.kilometrage)
    return search_profiles    
  end

  # TODO : Implement the SocialService (as a lib or model) responsible for sharing on social network
  def share_me
    SocialServices.tweet(self)
    SocialService.fb_post(self)
  end
end
