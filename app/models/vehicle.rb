class Vehicle < ActiveRecord::Base
  default_scope :order => "price asc"
  validates_presence_of :annee, :on => :create, :message => "doit être renseignée"
  validates_uniqueness_of :immatriculation, :on => :create, :message => "must be unique"
  
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
  
  after_create :tweet_it
  # after_update :tweet_it
    
  # Constantes
  PRICE = [["0", "0"], ["250", "250"], ["500", "500"], ["1000", "1000"], ["1500", "1500"], ["2000", "2000"], ["2500", "2500"], ["3000", "3500"], ["4000", "4000"], ["5000", "5000"], ["6000", "6000"], ["7000", "7000"], ["8000", "8000"], ["9000", "9000"], ["10000", "10000"], ["15000", "15000"], ["20000","20000"], ["25000", "25000"], ["30000", "30000"], ["40000", "40000"], ["50000", "50000"]]
  
  KILOMETRAGE = [["10 000 Km", "10000"], ["20 000 Km", "20000"], ["30 000 Km", "30000"], ["50 000 Km", "50000"], ["70 000 Km", "70000"], ["100 000 Km", "100000"], ["150 000 Km", "150000"], ["200 000 Km", "200000"]]
  
  ENERGY = [["Essence", "Essence"], ["Diesel", "Diesel"], ["Electrique", "Electrique"]]
  
  VITESSE = [["Manuel", "Manuel"], ["Automatique", "Automatique"]]
  
  #methodes
  named_scope :of_the_week, :conditions => ['select_for_week = ?', true]
  named_scope :sold, :conditions => ['disponibilite = ?', false]
  named_scope :available, :conditions => ['disponibilite = ?', true]  
  named_scope :with_price_criterias, lambda { |type, minprice, maxprice| { :conditions => ['type = ? AND price >= ? AND price <= ?', type, minprice, maxprice] } }
  
  def display_year
    self.annee.try(:year)
  end
  
  # Fetches search_profiles based on vehicle price and kilometrage
  def matching_searchprofiles
    search_profiles = SearchProfile.with_price_and_kilometer_criterias(self.price, self.kilometrage)
    return search_profiles    
  end
  
  private
  
  def tweet_it
    env = Rails.env
    if env != "test" # TODO : find a better way to handle twitter in specs
      # httpauth = Twitter::HTTPAuth.new("gilles.math@me.com", "occasionsgwada971")
      httpauth ||= Twitter::HTTPAuth.new(APP_CONFIG[env.to_sym]["twitter_email_login"], APP_CONFIG[env.to_sym]["twitter_password"])
      base = Twitter::Base.new(httpauth)
      # tweet the new vehicle added
      # TODO : change the tweet if it is an update
      base.update("Gwadaoccasions : #{self.modele} - Année: #{self.display_year} - #{self.kilometrage} KM - #{self.price} €")
    end
  end
end
