class PaymentNotification < ActiveRecord::Base
  default_scope { order("created_at desc") }
  belongs_to :subscription
  serialize :params # save params hash to database as an object for retrieval as the same object (Why?)
  after_create :mark_subscription_as_verified

  # Enum
  # enum status: [ :cancel, :verified, :paid ]
  
  private
  
  def mark_subscription_as_verified
    subscriber_id = params[:subscr_id]
    if status == "verified" || status == "paid"
      subscription.update_attributes(:subscription_date => Time.now, :status => "verified", :subscriber_id => subscriber_id)
      self.subscription.provider.update_attribute(:status => "active") unless self.subscription.provider.status == "active"
    elsif status == "cancel"
      subscription.update_attribute(:status => "cancel")
      self.subscription.provider.update_attribute(:status => "pending")
    end
  end
end
