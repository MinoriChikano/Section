class Response < ApplicationRecord
  belongs_to :audio
  validates :comment, presence: true
end
