class Search #< ActiveRecord::Base
  attr_accessor :minprice, :maxprice, :minkilometrage, :maxkilometrage, :minyear, :maxyear, :energy, :boite_vitesse, :category
  
  def initialize(params = {})
    
  end
end
