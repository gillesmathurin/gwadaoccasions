class SearchesController < ApplicationController
  
  def index  
  end
  
  def show
  end
  
  def create
    @search = Search.new(params[:search])
    @vehicles = @search.vehicles
    respond_to do |format|
      format.html { render :template => "searches/index" }
    end
  end
end
