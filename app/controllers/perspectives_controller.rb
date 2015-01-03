class PerspectivesController < ApplicationController
  def index
    @perspectives = Perspective.all
  end

  def destroy
    @perspective = Perspective.find(params.require(:id))
    if @perspective.destroy
      redirect_to perspectives_path, notice: 'Perspective deleted successfully.'
    else
      redirect_to @perspective, alert: 'Perspective could not be deleted.'
    end
  end
end
