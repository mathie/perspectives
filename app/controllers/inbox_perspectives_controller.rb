class InboxPerspectivesController < ApplicationController
  def show
    @inbox_perspective = klass.find(params.require(:id))
  end

  def new
    @inbox_perspective = klass.new
  end

  def create
    @inbox_perspective = klass.new(perspective_params)
    if @inbox_perspective.save
      redirect_to @inbox_perspective, notice: 'Perspective successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @inbox_perspective = klass.find(params.require(:id))
  end

  def update
    @inbox_perspective = klass.find(params.require(:id))
    if @inbox_perspective.update_attributes(perspective_params)
      redirect_to @inbox_perspective, notice: 'Perspective successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def perspective_params
    params.require(klass.name.underscore).permit(perspective_fields)
  end

  def klass
    InboxPerspective
  end

  def perspective_fields
    [:name, :description, :show_items]
  end
end
