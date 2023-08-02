class Response < ApplicationRecord
  belongs_to :audio
  validates :comment, presence: true
  mount_uploader :file, AudioUploader
end
