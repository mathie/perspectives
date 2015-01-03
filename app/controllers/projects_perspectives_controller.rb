class ProjectsPerspectivesController < ApplicationController
  def show
    @projects_perspective = ProjectsPerspective.find(params.require(:id))
  end

  def new
    @projects_perspective = ProjectsPerspective.new
  end

  def create
    @projects_perspective = ProjectsPerspective.new(projects_perspective_params)
    if @projects_perspective.save
      redirect_to @projects_perspective, notice: 'Perspective successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @projects_perspective = ProjectsPerspective.find(params.require(:id))
  end

  def update
    @projects_perspective = ProjectsPerspective.find(params.require(:id))
    if @projects_perspective.update_attributes(projects_perspective_params)
      redirect_to @projects_perspective, notice: 'Perspective successfully updated.'
    else
      render 'edit'
    end
  end

  private

  def projects_perspective_params
    params.require(:projects_perspective).permit(:name, :description, :show_items, :show_folders_in_outline)
  end
end
