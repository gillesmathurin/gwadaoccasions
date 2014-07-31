class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation
  
  has_many :selections
  has_many :vehicles, :through => :selections
  has_many :search_profiles
  
  # Fetches vehicles matching the user search profiles
  def matching_vehicles
    vehicles = []
    self.search_profiles.each do |profile|
      found_vehicles = Vehicle.with_price_criterias(profile.category, profile.minprice, profile.maxprice)
      vehicles.concat(found_vehicles)
    end
    vehicles
  end
end
