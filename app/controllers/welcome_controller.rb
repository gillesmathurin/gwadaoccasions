class WelcomeController < ApplicationController
  def index
    @search = Search.new
    @vehicle_number = Vehicle.count
    @user_number = User.count
    @vehicles_of_the_week = Vehicle.of_the_week
  end

end
