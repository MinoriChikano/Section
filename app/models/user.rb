class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :audios
  has_many :responses
  has_many :joins, dependent: :destroy
  #has_many :members, through: :joins, source: :user
end
