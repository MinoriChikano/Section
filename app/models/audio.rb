class Audio < ApplicationRecord
  # enum :key, %i(C C♯ D D♯ E F F♯ G G♯ A A♯ B Am A♯m Bm Cm C♯m Dm D♯m Em Fm F♯m Gm G♯m )
  belongs_to :user
  belongs_to :project
  has_many :responses, dependent: :destroy
  validates :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :bpm, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 255 }
  mount_uploader :file, AudioUploader
end
