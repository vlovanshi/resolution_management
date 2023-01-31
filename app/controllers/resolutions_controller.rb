class ResolutionsController < ApplicationController
  def index
    @name = params[:name]
    @resolutions = Resolution.all
  end
end
