class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @search_profiles = @user.search_profiles
  end

end
