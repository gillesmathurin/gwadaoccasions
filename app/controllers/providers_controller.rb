class ProvidersController < ApplicationController
  before_filter :authenticate_provider!
  
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
