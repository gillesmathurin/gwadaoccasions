class ProvidersController < ApplicationController
  before_filter :authenticate_provider!
  
  def show
    @provider = current_provider
    @plans = Plan.all
    @subscription = @provider.build_subscription
  end

end
