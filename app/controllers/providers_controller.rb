class ProvidersController < ApplicationController
  layout 'provider'
  before_filter :authenticate_provider!
  ssl_required :show
  
  def show
    @provider = current_provider
    @plans = Plan.all
    if @provider.subscription.nil?
      @subscription = @provider.build_subscription()
    else
      @subscription = @provider.subscription
    end
  end

end
