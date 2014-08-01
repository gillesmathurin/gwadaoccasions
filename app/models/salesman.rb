class Salesman < ActiveRecord::Base
  belongs_to :provider
  has_many :vehicles
  
  validates :name, uniqueness: true, on: :create
  validates :mobile_phone, uniqueness: true, on: :create
end
