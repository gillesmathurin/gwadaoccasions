class SearchProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @search_profile = current_user.search_profiles.build()
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
  
end
