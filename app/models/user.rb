class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :audios
  has_many :responses
  has_many :joins, dependent: :destroy
  has_many :join_projects, through: :joins, source: :project
  validates :email, presence: true

  def self.find_by_email(email)
    user = find_by(email: email)
  end
end
