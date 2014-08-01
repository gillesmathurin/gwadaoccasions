class Subscription < ActiveRecord::Base
  belongs_to :provider
  belongs_to :plan
  has_many :payment_notifications

  enum status: [ :pending, :verified, :cancel ]
  
end
