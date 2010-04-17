class Salesman < ActiveRecord::Base
  belongs_to :provider
  has_many :vehicles
  
  validates_uniqueness_of :name, :mobile_phone, :on => :create, :message => "doit être unique"
  
end
