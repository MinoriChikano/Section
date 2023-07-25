class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy] 

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: "プロジェクトを作成しました"
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice:"プロジェクトを削除しました"
  end

  private

  def project_params
    params.require(:project).permit(:id, :name)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
