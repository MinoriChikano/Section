# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    projects_path(resource)
  end 

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to projects_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to projects_path, notice: 'ゲスト管理者としてログインしました。'
  end
end
