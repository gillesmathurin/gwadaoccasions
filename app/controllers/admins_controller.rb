class AdminsController < ApplicationController
  def index
    redirect_to(admin_providers_path(current_admin))
  end
end
