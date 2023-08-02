class User < ApplicationRecord
  has_many :projects
  has_many :audios, dependent: :destroy
  has_many :responses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
