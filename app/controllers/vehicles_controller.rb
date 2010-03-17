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
      if current_user && !current_user.vehicles.include?(@vehicle)
        flash[:notice] = "Véhicule ajouté à votre sélection."
        current_user.vehicles << @vehicle
        format.html { redirect_to vehicle_path(@vehicle) }
      elsif current_user && current_user.vehicles.include?(@vehicle)
        flash[:notice] = "Véhicule déjà présent dans votre sélection."
        format.html { redirect_to vehicle_path(@vehicle)}
      else
        flash[:notice] = "Identifiez vous"
        format.html { redirect_to new_user_session_path()}
      end
    end
  end

end
