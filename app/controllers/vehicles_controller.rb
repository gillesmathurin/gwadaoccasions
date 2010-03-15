class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      format.html # render the show template
    end
  end
  
  def print
    
  end

end
