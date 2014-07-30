class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SslRequirement
  helper :all # include all helpers, all the time

  before_filter :vehicle_count, :visitor_count
  
  def ssl_required?
    return false if local_request? || RAILS_ENV == "test"
    super
  end
  
  layout :set_layout
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(Provider)
      provider_url(resource.id)
    else
      super
    end
  end
  
  private
  
  def vehicle_count
    @vehicle_number ||= Vehicle.count    
  end
  
  def visitor_count
    @user_number ||= User.count
  end
  
  def set_layout
    provider_signed_in? ? 'provider' : 'application'
  end
end