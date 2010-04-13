class Subscription < ActiveRecord::Base
  belongs_to :provider
  belongs_to :plan
  has_many :payment_notifications
  
  def pending?
    status == "pending"
  end
end
