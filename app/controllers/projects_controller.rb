class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy] 
  before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: "プロジェクトを作成しました"
    else
      render :new
    end
  end

  def show
    @projects = Project.all
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
