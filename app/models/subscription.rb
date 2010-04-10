class Subscription < ActiveRecord::Base
  belongs_to :provider
  belongs_to :plan
end
