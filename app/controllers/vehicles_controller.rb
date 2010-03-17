class VehiclesController < ApplicationController
  
  def index
    @vehicles = Vehicle.paginate(:page => params[:page], :per_page => 15)
    respond_to do |format|
      format.html {}
    end
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      format.html # render the show template
    end
  end
  
  def print    
  end
  
  def select
    @vehicle = Vehicle.find(params[:id])
    
    respond_to do |format|
      if current_user && !current_user.selections.include?(@vehicle)
        
      end
      format.html {  }
    end
  end

end
