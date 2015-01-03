class PerspectivesController < ApplicationController
  def index
    @perspectives = Perspective.all
  end

  def show
    @perspective = Perspective.find(params.require(:id))
  end

  def new
    @perspective = Perspective.new
  end

  def create
    @perspective = Perspective.new(perspective_params)
    if @perspective.save
      redirect_to @perspective, notice: 'Perspective created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @perspective = Perspective.find(params.require(:id))
  end

  def update
    @perspective = Perspective.find(params.require(:id))
    if @perspective.update_attributes(perspective_params)
      redirect_to @perspective, notice: 'Perspective updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @perspective = Perspective.find(params.require(:id))
    if @perspective.destroy
      redirect_to perspectives_path, notice: 'Perspective deleted successfully.'
    else
      redirect_to @perspective, alert: 'Perspective could not be deleted.'
    end
  end

  private
  def perspective_params
    params.require(:perspective).permit(:name, :description)
  end
end
