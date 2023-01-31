class ResolutionsController < ApplicationController
  def index
    @name = params[:name]
    @resolutions = Resolution.all
  end

  def destroy
    @resolution = Resolution.find(params[:id])
    @resolution.destroy

    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
