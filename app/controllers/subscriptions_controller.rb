class SubscriptionsController < ApplicationController
  before_filter :authenticate_provider!
  
  def new
  end
  
  def show
    @subscription = Subscription.find(params[:id])
    @provider = current_provider
  end
  
  def create
    @provider = current_provider
    @subscription = @provider.build_subscription(params[:subscription])
    @subscription.status = "pending"
    
    respond_to do |format|
      if @subscription.save      
        format.html { redirect_to(subscription_path(@subscription)) }
      else
        format.html { redirect_to(provider_path(@provider))}
      end
    end
  end
end
