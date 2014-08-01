class Search
  include ActiveModel::Model
  attr_accessor :minprice, :maxprice, :minkilometrage, :maxkilometrage, :minyear, :maxyear,
   :energy, :boite_vitesse, :category
  
  
  def vehicles
    @vehicles ||= find_vehicles 
  end
  
  private
  
  # TODO : refactor using Rails Upgrade handbook Chap. 4.4.1 - Better query composition
  def find_vehicles
    scope = Vehicle.scoped({})
    scope = scope.scoped :conditions => ["type = ?", @category] unless @category.blank?
    scope = scope.scoped :conditions => ["price >=?", @minprice] unless @minprice.blank?
    scope = scope.scoped :conditions => ["price <= ?", @maxprice] unless @maxprice.blank?
    scope = scope.scoped :conditions => ["kilometrage >= ?", @minkilometrage] unless @minkilometrage.blank?# || ["Jetski", "Bateau"].include(@category)
    scope = scope.scoped :conditions => ["kilometrage <= ?", @maxkilometrage] unless @maxkilometrage.blank?# || ["Jetski", "Bateau"].include(@category)
    scope = scope.scoped :conditions => ["annee >= ?", @minyear] unless @minyear.blank?
    scope = scope.scoped :conditions => ["annee <= ?", @maxyear] unless @maxyear.blank?
    scope = scope.scoped :conditions => ["energy = ?", @energy] unless @energy.blank?
    scope = scope.scoped :conditions => ["boite_vitesse = ?", @boite_vitesse] unless @boite_vitesse.blank? # || ["Jetski", "Bateau"].include(@category)
    scope = scope.scoped :conditions => ["disponibilite = ?", true]
    scope
  end
end
