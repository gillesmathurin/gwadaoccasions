class WelcomeController < ApplicationController
  def index
    @search = Search.new
    @vehicles_of_the_week = Vehicle.of_the_week
  end

end
