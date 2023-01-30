class ResolutionsController < ApplicationController
  def index
  	@resolutions = Resolution.all
  end
end
