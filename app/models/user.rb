class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :selections
  has_many :vehicles, :through => :selections
  has_many :search_profiles
  
  # Fetches vehicles matching the user search profiles
  # TODO : Reflect on the SearchProfile category field (Is it correct ??)
  def matching_vehicles
    vehicles = []
    self.search_profiles.each do |profile|
      found_vehicles = Vehicle.with_price_criterias(profile.category, profile.minprice, profile.maxprice)
      vehicles.concat(found_vehicles)
    end
    return vehicles
  end
end
