class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @search_profiles = @user.search_profiles
    @selections = @user.selections
    @matching_vehicles = @user.matching_vehicles
  end

end
