class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    Project.create(project_params)
    redirect_to new_project_path
  end

  def show
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
