class JoinsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    project = find_project(params[:team_id])
    # user = email_reliable?(join_params) ? User.find_by_email(email)(join_params) : nil
    if user
      project.join_member(user)
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

  def find_project(_project_id)
    Project.find(params[:project_id])
  end
end
