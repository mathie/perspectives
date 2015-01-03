class InboxPerspectivesController < ApplicationController
  def show
    @inbox_perspective = InboxPerspective.find(params.require(:id))
  end

  def new
    @inbox_perspective = InboxPerspective.new
  end

  def create
    @inbox_perspective = InboxPerspective.new(inbox_perspective_params)
    if @inbox_perspective.save
      redirect_to @inbox_perspective, notice: 'Perspective successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @inbox_perspective = InboxPerspective.find(params.require(:id))
  end

  def update
    @inbox_perspective = InboxPerspective.find(params.require(:id))
    if @inbox_perspective.update_attributes(inbox_perspective_params)
      redirect_to @inbox_perspective, notice: 'Perspective successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def inbox_perspective_params
    params.require(:inbox_perspective).permit(:name, :description, :show_items)
  end
end
