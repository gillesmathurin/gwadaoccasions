class SubscriptionsController < ApplicationController
  before_filter :authenticate_provider!, :except => :new
  ssl_required :show, :create, :update
  
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
      if @subscription.save!      
        format.html { redirect_to(subscription_path(@subscription)) }
      else
        format.html { redirect_to(provider_path(@provider))}
      end
    end
  end
  
  def update
    @subscription = current_provider.subscription
    
    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to subscription_path(@subscription) }
      else
        format.html { redirect_to provider_path(@subscription.provider)}
      end
    end
  end
  
  def congrats
    @provider = current_provider || Provider.find(params[:id])
    @subscription = @provider.subscription
  end
end
