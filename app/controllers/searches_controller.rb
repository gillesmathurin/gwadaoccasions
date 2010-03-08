class SearchesController < ApplicationController
  def create
    @search = Search.new(params[:search])
    @vehicles = @search.vehicles
    respond_to do |format|
      format.html { render :template => "welcome/index", :locals => {:vehicles => @vehicles} }
    end
  end
end
