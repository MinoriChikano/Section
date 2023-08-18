class Project < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :members, through: :joins, source: :user
  has_many :audios, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  # def join_member(user)
  #   Joins.create(user: user)
  # end
end
