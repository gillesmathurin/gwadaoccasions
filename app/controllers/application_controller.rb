# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  before_filter :vehicle_count, :visitor_count
  
  private
  
  def vehicle_count
    @vehicle_number = Vehicle.count    
  end
  
  def visitor_count
    @user_number = User.count
  end
end
