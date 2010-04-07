class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @search_profiles = @user.search_profiles
    @selections = @user.selections
    @compatible_vehicles = @user.compatible_vehicles
  end

end
