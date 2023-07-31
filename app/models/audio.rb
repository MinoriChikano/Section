class Audio < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :bpm, numericality: { greater_than_or_equal_to: 120, less_than_or_equal_to: 255 }
  
  mount_uploader :file, AudioUploader
end
