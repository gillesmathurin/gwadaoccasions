class PaymentNotification < ActiveRecord::Base
  default_scope :order => "created_at desc"
  belongs_to :subscription
  serialize :params
  after_create :mark_subscription_as_verified
  
  private
  
  def mark_subscription_as_verified
    subscriber_id = params[:subscr_id]
    if (status == "verified" || status == "paid")
      subscription.update_attributes(:subscription_date => Time.now, :status => "verified", :subscriber_id => subscriber_id)
      self.subscription.provider.update_attribute(:status => "active") unless self.subscription.provider.status == "active"
    elsif status == "cancel"
      subscription.update_attribute(:status => "cancel")
      self.subscription.provider.update_attribute(:status => "pending")
    end
  end
end
