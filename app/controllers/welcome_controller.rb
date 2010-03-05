class WelcomeController < ApplicationController
  def index
    @search = Search.new
    @vehicle_number = Vehicle.count
    @user_number = User.count
  end

end
