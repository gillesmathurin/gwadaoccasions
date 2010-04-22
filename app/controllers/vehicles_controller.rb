class VehiclesController < ApplicationController
  before_filter :authenticate_provider!, :only => [:new, :edit, :destroy]
  before_filter :find_provider
  
  def index
    if @provider
      @vehicles = @provider.vehicles.paginate(:page => params[:page], :per_page => 15)
    else
      @vehicles = Vehicle.paginate(:page => params[:page], :per_page => 15)
    end
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
  
  def new
    @vehicle = current_provider.vehicles.build()
  end
  
  def edit
    @vehicle = current_provider.vehicles.find(params[:id])
  end
  
  def create
    @vehicle = current_provider.vehicles.build(params[:vehicle])
    @vehicle[:type] = params[:vehicle][:type]
    
    respond_to do |wants|
      if @vehicle.save
        flash[:notice] = 'Véhicule enregistré avec succès.'
        wants.html { redirect_to( provider_vehicles_url(current_provider) ) }
        wants.xml { render :xml => @vehicle, :status => :created, :location => @vehicle }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @vehicle = current_provider.vehicles.find(params[:id])
    @vehicle[:type] = params[:vehicle][:type]
    
    respond_to do |wants|
      if @vehicle.update_attributes(params[:vehicle])
        flash[:notice] = "Modifications enregistrées"      
        wants.html { redirect_to(provider_vehicles_url(current_provider)) }
      else
        wants.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @vehicle = current_provider.vehicles.find(params[:id])
    @vehicle.destroy
    
    respond_to do |wants|
      wants.html { redirect_to provider_vehicles_url(current_provider) }
    end
  end
  
  def mark_as_sold
    @vehicle = current_provider.vehicles.find(params[:id])
    @vehicle.update_attribute(:disponibilite, false)
  end
  
  def select_for_week
    @vehicle = current_provider.vehicles.find(params[:id])
    @vehicle.update_attribute(:select_for_week, true)
  end
  
  private
  
  def find_provider
    @provider = Provider.find(params[:provider_id]) if params[:provider_id]
  end
end
