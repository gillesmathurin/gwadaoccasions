class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :selections
  has_many :vehicles, :through => :selections
  has_many :search_profiles
  
  def compatible_vehicles
    vehicles = []
    self.search_profiles.each do |profile|
      found_vehicles = Vehicle.with_price_criterias(profile.category, profile.minprice, profile.maxprice)
      vehicles.concat(found_vehicles)
    end
    vehicles
  end
end
