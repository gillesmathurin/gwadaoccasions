class ProvidersController < ApplicationController
  before_filter :authenticate_provider!
  
  def show
    @provider = current_provider
  end

end
