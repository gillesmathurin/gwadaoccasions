class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  ssl_required :create 
  
  before_filter :find_provider, :only => [:index]
  
  def index
    @payment_notifications = @provider.subscriptions.payment_notifications if @provider
  end
  
  def create
    notify = Paypal::Notification.new(request.raw_post)
    if notify.acknowledge
      if subscription_notification?(params) 
        PaymentNotification.create!(:params => params, :subscription_id => params[:invoice],
          :status => "verified")      
      elsif subscription_payment_notification?(params)
        PaymentNotification.create!(:params => params, :subscription_id => params[:invoice], :status => "paid")
      elsif subscription_canceled_notification?(params)
        PaymentNotification.create!(:params => params, :subscription_id => params[:invoice], :status => "cancel")
      end
    end
    render :nothing => true
  end
  
  private
  
  def subscription_notification?(params)
    params[:amount3] == plan_price(params[:invoice]) && params[:txn_type] == "subscr_signup" && params[:receiver_email] == APP_CONFIG[:paypal_email]
  end
  
  def subscription_payment_notification?(params)
    params[:payment_status] == "Completed" && params[:receiver_email] == APP_CONFIG[:paypal_email] && params[:payment_gross] == plan_price(params[:invoice]) && params[:txn_type] == "subscr_payment" && params[:mc_currency] == "EUR" && params[:mc_gross] == plan_price(params[:invoice])
  end
  
  def subscription_canceled_notification?(params)
    params[:receiver_email] == APP_CONFIG[:paypal_email] && params[:txn_type] == "subscr_cancel"
  end
  
  def plan_price(invoice)
    Subscription.find(invoice).plan.human_price
  end
  
  private
  
  def find_provider
    @provider = Provider.find(params[:provider_id]) if params[:provider_id]
  end
end
