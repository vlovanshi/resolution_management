class ResolutionsController < ApplicationController
  def index
    @user = User.find_by(first_name: params[:name]) || User.first
    @resolutions = @user.resolutions
  end

  def show
    @resolution = Resolution.find(params[:id])
  end

  def new
    @resolution = Resolution.new
  end

  def create
    @resolution = Resolution.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to resolution_url(@resolution), notice: 'Resolution was successfully created.' }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resolution = Resolution.find(params[:id])
    @resolution.destroy

    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def resolution_params
    params.require(:resolution).permit!
  end
end
