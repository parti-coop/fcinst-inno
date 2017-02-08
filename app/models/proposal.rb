class Proposal < ApplicationRecord
  belongs_to :interview
  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
