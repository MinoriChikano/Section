class Project < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :members, through: :joins, source: :user
  has_many :audios
  validates :name, presence: true
end
