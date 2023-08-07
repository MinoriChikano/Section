class JoinsController < ApplicationController
  before_action :authenticate_user!
  before_action :email_exist?, only: [:create]
  before_action :user_exist?, only: [:create]
  # before_action :owner_exist?, only: [:create]

  def new
    @project = Project.find(params[:project_id])
  end

  def create
    project = find_project(params[:project_id].keys.first)
    user = User.find_by_email(join_params)
    Join.create(user_id: user.id, project_id: project.id)
    redirect_to project_url(project), notice: "ユーザーが追加されました"

    # if user
    #   Join.create(user_id: user.id, project_id: project.id)
    #   redirect_to project_url(project), notice: "ユーザーが追加されました"
    # else
    #   redirect_to project_url(project), notice: "ユーザーが見つかりませんでした"
    # end
  end

  private

  def join_params
    params[:email]
  end

  def user_exist?
    project = find_project(params[:project_id].keys.first)
    redirect_to project_url(project), notice:"このユーザーは存在していません" unless User.exists?(email: params[:email])
  end

  def email_exist?
    project = find_project(params[:project_id].keys.first)
    redirect_to project_url(project), notice: "このユーザーはすでに登録されています" if project.members.exists?(email: params[:email])
  end

  # def owner_exist?
  #   project = find_project(params[:project_id].keys.first)
  #   redirect_to project_url(project), notice: "このユーザーはオーナ-として登録されています" if project.user
  # end

  # def email_reliable?(address)
  #   address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  # end

  def find_project(project_id)
    Project.find(project_id)
  end
end
