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
        current_user.vehicles << @vehicle
        flash[:notice] = "Véhicule ajouté à votre sélection."
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

  def tellafriend
    @vehicle = Vehicle.find(params[:id])
    from = params[:from_email]
    friend = params[:friend_email]
    if VehicleMailer.deliver_to_friend(from, friend, @vehicle)    
      flash[:notice] = "Email envoyé à votre ami."
    else
      flash[:notice] = "Vérifiez les adresses emails saisies."
    end
    render :partial => "shared/flash_messages", :layout => false
  end
end
