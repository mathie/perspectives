class PerspectivesController < ApplicationController
  def index
    @perspectives = Perspective.all
  end

  def show
    @perspective = klass.find(params.require(:id))
  end

  def choose
  end

  def new
    @perspective = klass.new
  end

  def create
    @perspective = klass.new(perspective_params)
    if @perspective.save
      redirect_to @perspective, notice: 'Perspective successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @perspective = klass.find(params.require(:id))
  end

  def update
    @perspective = klass.find(params.require(:id))
    if @perspective.update_attributes(perspective_params)
      redirect_to @perspective, notice: 'Perspective successfully updated.'
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
    params.require(klass.name.underscore).permit(perspective_fields)
  end

  def klass
    raise "Subclass must specify the class name"
  end

  def perspective_fields
    [:name, :description]
  end
end
