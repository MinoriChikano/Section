class JoinsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])
  end

  def create
    project = find_project(params[:project_id].keys.first)
    if email_reliable?(join_params)
      user = User.find_by_email(join_params)
    else
      user = nil
    end

    if user
      Join.create(user_id: user.id, project_id: project.id)
      redirect_to project_url(project), notice: "ユーザーが追加されました"
    else
      redirect_to project_url(project), notice: "ユーザーが見つかりませんでした"
    end
  end

  private

  def join_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def find_project(project_id)
    Project.find(project_id)
  end
end
