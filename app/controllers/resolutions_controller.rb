class ResolutionsController < ApplicationController
  before_action :find_resolution, only: [:show, :destroy]
  def index
    @user = User.find_by(first_name: params[:name]) || User.first #take first user if not available
    @resolutions = @user.resolutions
  end

  def show
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

  def find_resolution
    @resolution = Resolution.find(params[:id])
  end
end
