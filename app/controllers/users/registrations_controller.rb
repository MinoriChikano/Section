# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_guest_user, only: [:edit,:destroy]

  def after_sign_up_path_for(resource)
    projects_path(resource)
  end

  def ensure_guest_user
    if resource.email == 'guest@example.com' || resource.email == 'guest_admin@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集/削除できません。'
    end
  end
end
