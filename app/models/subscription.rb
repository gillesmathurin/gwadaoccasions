class Subscription < ActiveRecord::Base
  belongs_to :provider
  belongs_to :plan
  
  def pending?
    status == "pending"
  end
end
