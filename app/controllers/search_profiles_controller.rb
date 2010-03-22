class SearchProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @search_profile = current_user.search_profiles.build()
  end
  
  def edit
    @search_profile = current_user.search_profiles.find(params[:id])
  end
  
  def create
    @search_profile = current_user.search_profiles.build(params[:search_profile])
    
    respond_to do |format|
      if @search_profile.save
        flash[:notice] = 'Profil de recherche enregistré.'
        format.html { redirect_to(user_path(current_user.id)) }
        format.xml { render :xml => @search_profile, :status => :created, :location => @search_profile }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @search_profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @search_profile = current_user.search_profiles.find(params[:id])
    
    respond_to do |format|
      if @search_profile.update_attributes(params[:search_profile])
        flash[:notice] = "Profil de recherche modifié."
        format.html { redirect_to user_path(current_user.id) }        
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @search_profile = current_user.search_profiles.find(params[:id])
    @search_profile.destroy
    respond_to do |format|
      flash[:notice] = "Profil de recherche supprimé."
      format.html { redirect_to user_path(current_user.id) }
    end
  end
  
end
