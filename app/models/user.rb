class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :audios
  has_many :responses
  has_many :joins, dependent: :destroy
  has_many :join_projects, through: :joins, source: :project
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :email, presence: true
  
  def self.find_by_email(email)
    user = find_by(email: email)
  end
  
  def self.guest
    find_or_create_by!(name: 'ゲスト',
                       email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(name: 'ゲスト管理者',
                       email: 'guest_admin@example.com',
                       admin: true) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def guest?
    email == 'guest@example.com'
  end

  def guest_admin?
    email == 'guest_admin@example.com'
  end
end


