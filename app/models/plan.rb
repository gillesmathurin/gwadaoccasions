class Plan < ActiveRecord::Base
  has_many :subscriptions
  
  def human_price
    price.to_f / 100
  end
end
