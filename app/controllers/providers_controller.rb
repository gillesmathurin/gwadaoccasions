class ProvidersController < ApplicationController
  layout 'provider'
  before_filter :authenticate_provider!
  before_filter :authenticate_admin!, :only => [:index, :destroy, :activate, :deactivate]
  ssl_required :show, :index
  
  def index
    @providers = Provider.all.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @provider = current_provider
    @plans = Plan.all
    if @provider.subscription.nil?
      @subscription = @provider.build_subscription()
    else
      @subscription = @provider.subscription
    end
  end
  
  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to(admin_providers_path(current_admin))
  end
  
  def activate
    @provider = Provider.find(params[:id])
    @provider.update_attribute(:status, "active")
  end
  
  def deactivate
    @provider = Provider.find(params[:id])
    @provider.update_attribute(:status, "pending")
  end

end
