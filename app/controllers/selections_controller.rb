class SelectionsController < ApplicationController
  before_filter :authenticate_user!
  
  def destroy
    @selection = current_user.selections.find(params[:id])
    @selection.destroy
    
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
    end
  end
end
