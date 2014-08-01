class Search
  include ActiveModel::Model
  attr_accessor :minprice, :maxprice, :minkilometrage, :maxkilometrage, :minyear, :maxyear,
   :energy, :boite_vitesse, :category
  
  def vehicles
    @vehicles ||= find_vehicles 
  end
  
  private
  
  # TODO : refactor using Rails Upgrade handbook Chap. 4.4.1 - Better query composition
  # TODO : create a branch to use ElasticSearch
  def find_vehicles
    scope = Vehicle.all
    scope = scope.where("type = ?", @category) unless @category.blank?
    scope = scope.where("price >=?", @minprice) unless @minprice.blank?
    scope = scope.where("price <= ?", @maxprice) unless @maxprice.blank?
    scope = scope.where("kilometrage >= ?", @minkilometrage) unless @minkilometrage.blank?
    scope = scope.where("kilometrage <= ?", @maxkilometrage) unless @maxkilometrage.blank?
    scope = scope.where("annee >= ?", start_of_year(@minyear)) unless @minyear.blank?
    scope = scope.where("annee <= ?", end_of_year(@maxyear)) unless @maxyear.blank?
    scope = scope.where("energy = ?", @energy) unless @energy.blank?
    scope = scope.where("boite_vitesse = ?", @boite_vitesse) unless @boite_vitesse.blank?
    scope = scope.where("disponibilite = ?", true)
    scope
  end

  def start_of_year(year)
    Date.today.change(year: year.to_i).beginning_of_year
  end

  def end_of_year(year)
    Date.today.change(year: year.to_i).end_of_year
  end
end
