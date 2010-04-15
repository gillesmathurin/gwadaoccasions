class Salesman < ActiveRecord::Base
  belongs_to :provider
  
  validates_uniqueness_of :name, :mobile_phone, :on => :create, :message => "doit être unique"
end
